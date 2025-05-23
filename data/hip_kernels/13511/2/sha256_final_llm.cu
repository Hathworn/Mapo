#include "hip/hip_runtime.h"
#include "includes.h"

#define uchar unsigned char // 8-bit byte
#define uint unsigned int // 32-bit word

#define DBL_INT_ADD(a,b,c) if (a > 0xffffffff - (c)) ++b; a += c;
#define ROTLEFT(a,b) (((a) << (b)) | ((a) >> (32-(b))))
#define ROTRIGHT(a,b) (((a) >> (b)) | ((a) << (32-(b))))

#define CH(x,y,z) (((x) & (y)) ^ (~(x) & (z)))
#define MAJ(x,y,z) (((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z)))
#define EP0(x) (ROTRIGHT(x,2) ^ ROTRIGHT(x,13) ^ ROTRIGHT(x,22))
#define EP1(x) (ROTRIGHT(x,6) ^ ROTRIGHT(x,11) ^ ROTRIGHT(x,25))
#define SIG0(x) (ROTRIGHT(x,7) ^ ROTRIGHT(x,18) ^ ((x) >> 3))
#define SIG1(x) (ROTRIGHT(x,17) ^ ROTRIGHT(x,19) ^ ((x) >> 10))

typedef struct{
    uchar data[64];
    uint datalen;
    uint bitlen[2];
    uint state[8];
} SHA256_CTX;

__device__ uint k[64] = {
    0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
    0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
    0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
    0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
    0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
    0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
    0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
    0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
};

SHA256_CTX *cpuSHA_CTX;
SHA256_CTX *gpuSHA_CTX;

int BLOCKS = 10;
int THREADS = 500;

extern "C"
__device__ void sha256_transform(SHA256_CTX *ctx, uchar data[]) {
    int q = blockIdx.x * blockDim.x + threadIdx.x;
    uint a,b,c,d,e,f,g,h,i,t1,t2,m[64];

    // Unroll data preparation loop for efficiency
    #pragma unroll
    for (i = 0; i < 16; ++i) {
        m[i] = (data[i*4] << 24) | (data[i*4+1] << 16) | (data[i*4+2] << 8) | (data[i*4+3]);
    }
    for (i = 16; i < 64; ++i) {
        m[i] = SIG1(m[i-2]) + m[i-7] + SIG0(m[i-15]) + m[i-16];
    }

    // Load state into local variables
    a = ctx[q].state[0];
    b = ctx[q].state[1];
    c = ctx[q].state[2];
    d = ctx[q].state[3];
    e = ctx[q].state[4];
    f = ctx[q].state[5];
    g = ctx[q].state[6];
    h = ctx[q].state[7];

    // Unroll main loop for computation
    #pragma unroll
    for (i = 0; i < 64; ++i) {
        t1 = h + EP1(e) + CH(e,f,g) + k[i] + m[i];
        t2 = EP0(a) + MAJ(a,b,c);
        h = g;
        g = f;
        f = e;
        e = d + t1;
        d = c;
        c = b;
        b = a;
        a = t1 + t2;
    }

    // Write results back to global memory
    ctx[q].state[0] += a;
    ctx[q].state[1] += b;
    ctx[q].state[2] += c;
    ctx[q].state[3] += d;
    ctx[q].state[4] += e;
    ctx[q].state[5] += f;
    ctx[q].state[6] += g;
    ctx[q].state[7] += h;
}
__global__ void sha256_final(SHA256_CTX *ctx, uchar *gpuResult) {
    int q = blockIdx.x * blockDim.x + threadIdx.x;

    uint i;
    i = ctx[q].datalen;

    // Pad data
    if (ctx[q].datalen < 56) {
        ctx[q].data[i++] = 0x80;
        while (i < 56) ctx[q].data[i++] = 0x00;
    } else {
        ctx[q].data[i++] = 0x80;
        while (i < 64) ctx[q].data[i++] = 0x00;
        sha256_transform(ctx,ctx[q].data);
        memset(ctx[q].data,0,56);
    }

    // Append bit length
    DBL_INT_ADD(ctx[q].bitlen[0],ctx[q].bitlen[1],ctx[q].datalen * 8);
    ctx[q].data[63] = ctx[q].bitlen[0];
    ctx[q].data[62] = ctx[q].bitlen[0] >> 8;
    ctx[q].data[61] = ctx[q].bitlen[0] >> 16;
    ctx[q].data[60] = ctx[q].bitlen[0] >> 24;
    ctx[q].data[59] = ctx[q].bitlen[1];
    ctx[q].data[58] = ctx[q].bitlen[1] >> 8;
    ctx[q].data[57] = ctx[q].bitlen[1] >> 16;
    ctx[q].data[56] = ctx[q].bitlen[1] >> 24;
    sha256_transform(ctx,ctx[q].data);

    // Reverse the bytes for output
    #pragma unroll
    for (i=0; i < 4; ++i) {
        gpuResult[i]    = (ctx[q].state[0] >> (24-i*8)) & 0x000000ff;
        gpuResult[i+4]  = (ctx[q].state[1] >> (24-i*8)) & 0x000000ff;
        gpuResult[i+8]  = (ctx[q].state[2] >> (24-i*8)) & 0x000000ff;
        gpuResult[i+12] = (ctx[q].state[3] >> (24-i*8)) & 0x000000ff;
        gpuResult[i+16] = (ctx[q].state[4] >> (24-i*8)) & 0x000000ff;
        gpuResult[i+20] = (ctx[q].state[5] >> (24-i*8)) & 0x000000ff;
        gpuResult[i+24] = (ctx[q].state[6] >> (24-i*8)) & 0x000000ff;
        gpuResult[i+28] = (ctx[q].state[7] >> (24-i*8)) & 0x000000ff;
    }
}
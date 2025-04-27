#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void warp_reduce(float* S, int tx) {
    // Optimize by using warp-synchronous primitives
    if (tx < 32) {
        volatile float* vsmem = S;
        vsmem[tx] += vsmem[tx + 32];
        vsmem[tx] += vsmem[tx + 16];
        vsmem[tx] += vsmem[tx + 8];
        vsmem[tx] += vsmem[tx + 4];
        vsmem[tx] += vsmem[tx + 2];
        vsmem[tx] += vsmem[tx + 1];
    }
}

__global__ void reduce_v4(float* in, float* out, int n) {
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int BX = blockDim.x;
    int i = bx * (BX * 2) + tx;

    __shared__ float S[THEAD_MAX];

    // Preload data and reduce across threads in a block
    S[tx] = in[i] + in[i + BX];
    __syncthreads();

    for (int s = BX / 2; s > WARP_SIZE; s >>= 1) {
        if (tx < s) {
            S[tx] += S[tx + s];
        }
        __syncthreads();
    }
    
    // Final warp reduction
    if (tx < WARP_SIZE) {
        warp_reduce(S, tx);
    }
    
    // Write the result of this block to global memory
    if (tx == 0) {
        out[bx] = S[0];
    }
}
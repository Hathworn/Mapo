#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaProcessUnsignedChar0(unsigned char *dst, unsigned char *src, int imgW, int imgH)
{
    // Calculate global positions
    int x = (blockIdx.x * blockDim.x + threadIdx.x) * 2;
    int y = (blockIdx.y * blockDim.y + threadIdx.y) * 2;
    int px = y * imgW + x;

    // Ensure within bounds
    if (x >= imgW - 2 || y >= imgH - 2 || x < 1 || y < 1) return;

    // Precompute source indexes
    int sx1 = px - imgW;
    int sx2 = sx1 + 1;
    int sx3 = sx1 + 2;
    int sx4 = px - 1;
    int sx5 = px;
    int sx6 = px + 1;
    int sx7 = sx6 + 1;
    int sx8 = px + imgW - 1;
    int sx9 = px + imgW;
    int sxa = sx9 + 1;
    int sxb = sx9 + 2;
    int sxc = px + imgW * 2 - 1;
    int sxd = px + imgW * 2;
    int sxe = sxd + 1;

    // Load source data into local registers
    int g1 = src[sx2];
    int g2 = src[sx5];
    int g3 = src[sx7];
    int g4 = src[sx8];
    int g5 = src[sxa];
    int g6 = src[sxd];
    int b0 = src[sx4];
    int b1 = src[sx6];
    int b2 = src[sxc];
    int b3 = src[sxe];
    int r0 = src[sx1];
    int r1 = src[sx3];
    int r2 = src[sx9];
    int r3 = src[sxb];

    // Compute destination values
    int db0 = (b0 + b1) >> 1;
    int dg0 = g2;
    int dr0 = (r0 + r1) >> 1;
    int db1 = b1;
    int dg1 = (g1 + g2 + g3 + g5) >> 2;
    int dr1 = (r0 + r1 + r2 + r3) >> 2;
    int db2 = (b0 + b1 + b2 + b3) >> 2;
    int dg2 = (g2 + g4 + g5 + g6) >> 2;
    int dr2 = r2;
    int db3 = (b1 + b3) >> 1;
    int dg3 = g5;
    int dr3 = (r2 + r3) >> 1;

    // Precompute destination indexes
    int dx = px * 3;
    int dst0 = dx;
    int dst1 = dx + 3;
    int dst2 = dx + imgW * 3;
    int dst3 = dx + (imgW + 1) * 3;

    // Store computed values to destination
    dst[dst0 + 0] = (unsigned char)db0;
    dst[dst0 + 1] = (unsigned char)dg0;
    dst[dst0 + 2] = (unsigned char)dr0;
    dst[dst1 + 0] = (unsigned char)db1;
    dst[dst1 + 1] = (unsigned char)dg1;
    dst[dst1 + 2] = (unsigned char)dr1;
    dst[dst2 + 0] = (unsigned char)db2;
    dst[dst2 + 1] = (unsigned char)dg2;
    dst[dst2 + 2] = (unsigned char)dr2;
    dst[dst3 + 0] = (unsigned char)db3;
    dst[dst3 + 1] = (unsigned char)dg3;
    dst[dst3 + 2] = (unsigned char)dr3;
}
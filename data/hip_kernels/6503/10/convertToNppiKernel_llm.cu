#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for conversion
__global__ static void convertToNppiKernel(uint16_t *dSrc, uint8_t *dDst, int nSrcWidth, int nDstWidth, int nDstHeight, int *lookupTable) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;
    uint32_t v0, y0, u0, y2, u1, y1, u2, y3, v1, y5, v2, y4;
    uint16_t tt[6];
    uint4 pF;
    int nDstH = nDstHeight;
    int nDstW = nSrcWidth / 8;

    // Compute only if thread is within valid bounds
    if (tid < nDstW && tidd < nDstH) {
        int j = tidd * nSrcWidth;
        int k = tid * 8;

        // Efficiently load source data
        pF.x = ((uint32_t)dSrc[j + k]) | ((uint32_t)dSrc[j + k + 1] << 16);
        pF.y = ((uint32_t)dSrc[j + k + 2]) | ((uint32_t)dSrc[j + k + 3] << 16);
        pF.z = ((uint32_t)dSrc[j + k + 4]) | ((uint32_t)dSrc[j + k + 5] << 16);
        pF.w = ((uint32_t)dSrc[j + k + 6]) | ((uint32_t)dSrc[j + k + 7] << 16);

        // Efficient unpack for each segment
        #pragma unroll
        for (int i = 0; i < 4; ++i) {
            uint32_t v = (pF.x & 0x3FF00000) >> 20;
            uint32_t y = ((pF.x & 0x000FFC00) >> 10) * 1000;
            uint32_t u = (pF.x & 0x000003FF);

            int r = 1407 * v - 720384;
            int g = 716 * v + 345 * u - 543232;
            int b = 1779 * u - 910848;

            tt[0] = (y + r) / 1000;
            tt[1] = (y - g) / 1000;
            tt[2] = (y + b) / 1000;

            dDst[j * 9 / 4 + (k + i * 6)] = lookupTable[tt[0]];
            dDst[j * 9 / 4 + (k + i * 6 + 1)] = lookupTable[tt[1]];
            dDst[j * 9 / 4 + (k + i * 6 + 2)] = lookupTable[tt[2]];

            tt[3] = ((j + k + i * 2) + r) / 1000;
            tt[4] = ((j + k + i * 2 + 1) - g) / 1000;
            tt[5] = ((j + k + i * 3) + b) / 1000;

            dDst[j * 9 / 4 + (k + i * 6 + 3)] = lookupTable[tt[3]];
            dDst[j * 9 / 4 + (k + i * 6 + 4)] = lookupTable[tt[4]];
            dDst[j * 9 / 4 + (k + i * 6 + 5)] = lookupTable[tt[5]];
        }
    }
}
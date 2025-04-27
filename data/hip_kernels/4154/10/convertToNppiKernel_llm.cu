```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void convertToNppiKernel(uint16_t *dSrc, uint8_t *dDst, int nSrcWidth, int nDstWidth, int nDstHeight, int *lookupTable) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;
    int nDstH = nDstHeight;
    int nDstW = nSrcWidth / 8;

    // Ensure we're within bounds
    if (tid >= nDstW || tidd >= nDstH) return;

    int j = tidd * nSrcWidth;
    int k = tid * 8;
    uint32_t v0, y0, u0, y2, u1, y1, u2, y3, v1, y5, v2, y4;
    uint16_t tt[6];
    uint4 pF;

    pF.x = (uint32_t)dSrc[j + k + 0] + ((uint32_t)dSrc[j + k + 1] << 16);
    pF.y = (uint32_t)dSrc[j + k + 2] + ((uint32_t)dSrc[j + k + 3] << 16);
    pF.z = (uint32_t)dSrc[j + k + 4] + ((uint32_t)dSrc[j + k + 5] << 16);
    pF.w = (uint32_t)dSrc[j + k + 6] + ((uint32_t)dSrc[j + k + 7] << 16);

    // Extract and compute values
    const int shift1 = 20, shift2 = 10;
    const int multFactor = 1000;
    v0 = (pF.x >> shift1) & 0x3FF;
    y0 = ((pF.x >> shift2) & 0x3FF) * multFactor;
    u0 = pF.x & 0x3FF;
    y2 = ((pF.y >> shift1) & 0x3FF) * multFactor;
    u1 = (pF.y >> shift2) & 0x3FF;
    y1 = (pF.y & 0x3FF) * multFactor;
    u2 = (pF.z >> shift1) & 0x3FF;
    y3 = ((pF.z >> shift2) & 0x3FF) * multFactor;
    v1 = pF.z & 0x3FF;
    y5 = ((pF.w >> shift1) & 0x3FF) * multFactor;
    v2 = (pF.w >> shift2) & 0x3FF;
    y4 = (pF.w & 0x3FF) * multFactor;

    // Common calculations reduction using lambdas
    auto computeRGB = [multFactor](int y, int v, int u, int &r, int &g, int &b) {
        r = 1407 * v - 720384;
        g = 716 * v + 345 * u - 543232;
        b = 1779 * u - 910848;
    };

    k = tid * 18;
    j = j * 9 / 4;
    
    int r, g, b;
    // Process and store results using a loop
    auto processAndStore = [&](int idx, int y, int v, int u) {
        computeRGB(y, v, u, r, g, b);
        tt[0] = (y + r) / multFactor;
        tt[1] = (y - g) / multFactor;
        tt[2] = (y + b) / multFactor;
        
        dDst[j + k + idx] = lookupTable[tt[0]];
        dDst[j + k + idx + 1] = lookupTable[tt[1]];
        dDst[j + k + idx + 2] = lookupTable[tt[2]];
    };

    processAndStore(0, y0, v0, u0);
    processAndStore(3, y1, v0, u0);
    processAndStore(6, y2, v1, u1);
    processAndStore(9, y3, v1, u1);
    processAndStore(12, y4, v2, u2);
    processAndStore(15, y5, v2, u2);
}
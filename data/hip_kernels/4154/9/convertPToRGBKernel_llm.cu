#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void convertPToRGBKernel(const uint16_t *dpSrc, uint8_t *tt1, int nSrcWidth, int nDstWidth, int nDstHeight, int *lookupTable) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;
    uint32_t v0, y0, u0, y1;
    int nDstH = nDstHeight;
    int nDstW = nSrcWidth / 2;

    // Ensure thread indices are within bounds
    if (tid < nDstW && tidd < nDstH) {
        int k = tid * 2;
        int j = tidd * nSrcWidth;

        // Load Y and U, V components; avoid recalculation
        y0 = static_cast<uint32_t>(dpSrc[j + k]) * 1000;
        y1 = static_cast<uint32_t>(dpSrc[j + k + 1]) * 1000;

        k = tid;
        j = tidd * nSrcWidth / 2 + nDstHeight * nSrcWidth;
        u0 = static_cast<uint32_t>(dpSrc[j + k]);

        j = tidd * nSrcWidth / 2 + nDstHeight * nSrcWidth * 3 / 2;
        v0 = static_cast<uint32_t>(dpSrc[j + k]);

        // Calculate color components only once
        int r = 1407 * v0 - 720384, g = 716 * v0 + 345 * u0 - 543232, b = 1779 * u0 - 910848;

        k = tid * 6;
        j = tidd * nDstWidth * 3;

        // Use shared temporary variables for conversion
        uint16_t tt0 = (y0 + r) / 1000;
        uint16_t tt1_tmp = (y0 - g) / 1000;
        uint16_t tt2 = (y0 + b) / 1000;
        uint16_t tt3 = (y1 + r) / 1000;
        uint16_t tt4 = (y1 - g) / 1000;
        uint16_t tt5 = (y1 + b) / 1000;

        // Perform look-up table transformation
        tt1[j + k] = lookupTable[tt0];
        tt1[j + k + 1] = lookupTable[tt1_tmp];
        tt1[j + k + 2] = lookupTable[tt2];
        tt1[j + k + 3] = lookupTable[tt3];
        tt1[j + k + 4] = lookupTable[tt4];
        tt1[j + k + 5] = lookupTable[tt5];
    }
}
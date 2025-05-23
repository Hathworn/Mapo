#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void convertToRGBKernel(const uint16_t *pV210, uint16_t *tt, int nSrcWidth, int nDstWidth, int nDstHeight) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;

    if (tid < (nSrcWidth / 8) && tidd < nDstHeight) {
        uint32_t v0, y0, u0, y2, u1, y1, u2, y3, v1, y5, v2, y4;
        uint4 pF;

        int j = tidd * nSrcWidth;
        int k = tid * 8;

        // Fetch and combine values from pV210 array in fewer operations
        pF.x = (uint32_t)pV210[j + k + 0] | (uint32_t)pV210[j + k + 1] << 16;
        pF.y = (uint32_t)pV210[j + k + 2] | (uint32_t)pV210[j + k + 3] << 16;
        pF.z = (uint32_t)pV210[j + k + 4] | (uint32_t)pV210[j + k + 5] << 16;
        pF.w = (uint32_t)pV210[j + k + 6] | (uint32_t)pV210[j + k + 7] << 16;

        // Extract and scale
        v0 = (pF.x & 0x3FF00000) >> 20;
        y0 = ((pF.x & 0x000FFC00) >> 10) * 1000;
        u0 = pF.x & 0x000003FF;
        y2 = ((pF.y & 0x3FF00000) >> 20) * 1000;
        u1 = (pF.y & 0x000FFC00) >> 10;
        y1 = (pF.y & 0x000003FF) * 1000;
        u2 = (pF.z & 0x3FF00000) >> 20;
        y3 = ((pF.z & 0x000FFC00) >> 10) * 1000;
        v1 = pF.z & 0x000003FF;
        y5 = ((pF.w & 0x3FF00000) >> 20) * 1000;
        v2 = (pF.w & 0x000FFC00) >> 10;
        y4 = (pF.w & 0x000003FF) * 1000;

        k = tid * 18; // Calculate new index for storing results
        j = (j * 9) / 4;

        // Compute once, reuse for both y0, y1
        int r = 1407 * v0 - 720384;
        int g = 716 * v0 + 345 * u0 - 543232;
        int b = 1779 * u0 - 910848;

        // Fill output pixels
        tt[j + k + 0] = (y0 + r) / 1000;
        tt[j + k + 1] = (y0 - g) / 1000;
        tt[j + k + 2] = (y0 + b) / 1000;

        tt[j + k + 3] = (y1 + r) / 1000;
        tt[j + k + 4] = (y1 - g) / 1000;
        tt[j + k + 5] = (y1 + b) / 1000;

        // Update for y2, y3
        r = 1407 * v1 - 720384;
        g = 716 * v1 + 345 * u1 - 543232;
        b = 1779 * u1 - 910848;

        tt[j + k + 6] = (y2 + r) / 1000;
        tt[j + k + 7] = (y2 - g) / 1000;
        tt[j + k + 8] = (y2 + b) / 1000;

        tt[j + k + 9] = (y3 + r) / 1000;
        tt[j + k + 10] = (y3 - g) / 1000;
        tt[j + k + 11] = (y3 + b) / 1000;

        // Update for y4, y5
        r = 1407 * v2 - 720384;
        g = 716 * v2 + 345 * u2 - 543232;
        b = 1779 * u2 - 910848;

        tt[j + k + 12] = (y4 + r) / 1000;
        tt[j + k + 13] = (y4 - g) / 1000;
        tt[j + k + 14] = (y4 + b) / 1000;

        tt[j + k + 15] = (y5 + r) / 1000;
        tt[j + k + 16] = (y5 - g) / 1000;
        tt[j + k + 17] = (y5 + b) / 1000;
    }
}
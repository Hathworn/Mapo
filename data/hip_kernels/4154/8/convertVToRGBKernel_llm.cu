#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void convertVToRGBKernel(const uint16_t *pV210, uint8_t *tt1, int nSrcWidth, int nDstWidth, int nDstHeight, int *lookupTable) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;
    uint16_t tt[6];
    int nDstH = nDstHeight;
    int nDstW = nSrcWidth / 8;

    if (tid < nDstW && tidd < nDstH) {
        // Refactor repetitive calculations into a function for clarity and potential performance.
        auto processPixel = [&](uint32_t y, uint32_t u, uint32_t v, uint8_t *output) {
            int r = 1407 * v - 720384, g = 716 * v + 345 * u - 543232, b = 1779 * u - 910848;
            tt[0] = (y + r) / 1000;
            tt[1] = (y - g) / 1000;
            tt[2] = (y + b) / 1000;
            output[0] = lookupTable[tt[0]];
            output[1] = lookupTable[tt[1]];
            output[2] = lookupTable[tt[2]];
        };

        int j = (tidd * nSrcWidth * 9) / 4;
        int k = tid * 18;

        uint4 pF;
        int baseIdx = tidd * nSrcWidth + tid * 8;
        pF.x = (uint32_t)pV210[baseIdx + 0] + ((uint32_t)pV210[baseIdx + 1] << 16);
        pF.y = (uint32_t)pV210[baseIdx + 2] + ((uint32_t)pV210[baseIdx + 3] << 16);
        pF.z = (uint32_t)pV210[baseIdx + 4] + ((uint32_t)pV210[baseIdx + 5] << 16);
        pF.w = (uint32_t)pV210[baseIdx + 6] + ((uint32_t)pV210[baseIdx + 7] << 16);

        // Process chunks of the pixel data
        processPixel((pF.x & 0x000FFC00) >> 10 * 1000, (pF.x & 0x000003FF), (pF.x & 0x3FF00000) >> 20, &tt1[j + k + 0]);
        processPixel((pF.y & 0x000003FF) * 1000, (pF.y & 0x000FFC00) >> 10, (pF.y & 0x3FF00000) >> 20, &tt1[j + k + 3]);
        processPixel((pF.z & 0x000FFC00) >> 10 * 1000, (pF.z & 0x3FF00000) >> 20, (pF.z & 0x000003FF), &tt1[j + k + 6]);
        processPixel((pF.w & 0x000003FF) * 1000, (pF.w & 0x000FFC00) >> 10, (pF.w & 0x3FF00000) >> 20, &tt1[j + k + 9]);
        processPixel((pF.z & 0x000FFC00) >> 10 * 1000, (pF.z & 0x3FF00000) >> 20, (pF.z & 0x000003FF), &tt1[j + k + 12]);
    }
}
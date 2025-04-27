#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void convertToRGBTestKernel(const uint16_t *pV210, uint8_t *tt, int nSrcWidth, int nDstWidth, int nDstHeight) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;

    if (tid < (nSrcWidth / 8) && tidd < nDstHeight) {
        // Precompute indices
        int j = (tidd * nSrcWidth) * 9 / 4;
        int k = tid * 18;

        uint32_t v0, y0, u0, y2, u1, y1, u2, y3, v1, y5, v2, y4;
        uint4 pF;

        // Coalesced memory access to load data
        int baseIdx = tidd * nSrcWidth + tid * 8;
        pF.x = (uint32_t)pV210[baseIdx + 0] + ((uint32_t)pV210[baseIdx + 1] << 16);
        pF.y = (uint32_t)pV210[baseIdx + 2] + ((uint32_t)pV210[baseIdx + 3] << 16);
        pF.z = (uint32_t)pV210[baseIdx + 4] + ((uint32_t)pV210[baseIdx + 5] << 16);
        pF.w = (uint32_t)pV210[baseIdx + 6] + ((uint32_t)pV210[baseIdx + 7] << 16);

        // Load and compute YUV components
        v0 = (pF.x >> 20) & 0x3FF;
        y0 = ((pF.x >> 10) & 0x3FF) * 1000;
        u0 = pF.x & 0x3FF;
        y2 = ((pF.y >> 20) & 0x3FF) * 1000;
        u1 = (pF.y >> 10) & 0x3FF;
        y1 = (pF.y & 0x3FF) * 1000;
        u2 = (pF.z >> 20) & 0x3FF;
        y3 = ((pF.z >> 10) & 0x3FF) * 1000;
        v1 = pF.z & 0x3FF;
        y5 = ((pF.w >> 20) & 0x3FF) * 1000;
        v2 = (pF.w >> 10) & 0x3FF;
        y4 = (pF.w & 0x3FF) * 1000;

        // Precompute common multipliers for output conversion
        const float scale = 0.249f / 1000.f;

        // Compute and store RGB for each pixel
        for (int i = 0; i < 2; ++i) {
            // Calculate RGB
            int r = 1407 * ((i == 0) ? v0 : v1) - 720384;
            int g = 716 * ((i == 0) ? v0 : v1) + 345 * ((i == 0) ? u0 : u1) - 543232;
            int b = 1779 * ((i == 0) ? u0 : u1) - 910848;

            int yOffsetIndex = (i == 0) ? 0 : 9;
            int yOffset[2] = {0, 3};

            for (int yIdx = 0; yIdx < 2; ++yIdx) {
                int yComp = ((yIdx == 0) ? y0 : y2) + ((i == 1) ? yOffset[yIdx] : 0);
                tt[j + k + yOffsetIndex + yIdx * 3 + 0] = (yComp + r) * scale;
                tt[j + k + yOffsetIndex + yIdx * 3 + 1] = (yComp - g) * scale;
                tt[j + k + yOffsetIndex + yIdx * 3 + 2] = (yComp + b) * scale;
            }
        }

        // Compute and store RGB for the last two pixels
        int r = 1407 * v2 - 720384;
        int g = 716 * v2 + 345 * u2 - 543232;
        int b = 1779 * u2 - 910848;

        tt[j + k + 12] = (y4 + r) * scale;
        tt[j + k + 13] = (y4 - g) * scale;
        tt[j + k + 14] = (y4 + b) * scale;

        tt[j + k + 15] = (y5 + r) * scale;
        tt[j + k + 16] = (y5 - g) * scale;
        tt[j + k + 17] = (y5 + b) * scale;
    }
}
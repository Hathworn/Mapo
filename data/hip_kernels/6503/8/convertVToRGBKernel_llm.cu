#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void convertVToRGBKernel(const uint16_t *pV210, uint8_t *tt1, int nSrcWidth, int nDstWidth, int nDstHeight, int *lookupTable) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;
    uint16_t tt[6];
    uint4 pF;
    int nDstH = nDstHeight;
    int nDstW = nSrcWidth / 8;

    if (tid < nDstW && tidd < nDstH) {
        int j = tidd * nSrcWidth;
        int k = tid * 8;
        pF.x = (uint32_t)pV210[j + k + 0] + ((uint32_t)pV210[j + k + 1] << 16);
        pF.y = (uint32_t)pV210[j + k + 2] + ((uint32_t)pV210[j + k + 3] << 16);
        pF.z = (uint32_t)pV210[j + k + 4] + ((uint32_t)pV210[j + k + 5] << 16);
        pF.w = (uint32_t)pV210[j + k + 6] + ((uint32_t)pV210[j + k + 7] << 16);

        // Simplify bit manipulations using masks
        uint32_t v[3], y[6], u[3];
        v[0] = (pF.x >> 20) & 0x3FF;
        y[0] = ((pF.x >> 10) & 0xFFC) * 1000;
        u[0] = pF.x & 0x3FF;

        y[1] = pF.y & 0x3FF * 1000;
        u[1] = (pF.y >> 10) & 0x3FF;

        y[2] = ((pF.y >> 20) & 0xFFC) * 1000;
        v[1] = pF.z & 0x3FF;

        y[3] = ((pF.z >> 10) & 0xFFC) * 1000;
        u[2] = (pF.z >> 20) & 0x3FF;

        y[4] = pF.w & 0x3FF * 1000;
        v[2] = (pF.w >> 10) & 0x3FF;

        y[5] = ((pF.w >> 20) & 0xFFC) * 1000;

        k = tid * 18;
        j = (j * 9) / 4;

#pragma unroll
        for (int i = 0; i < 3; ++i) {
            int r = 1407 * v[i] - 720384;
            int g = 716 * v[i] + 345 * u[i] - 543232;
            int b = 1779 * u[i] - 910848;

            tt[0] = (y[i * 2] + r) / 1000;
            tt[1] = (y[i * 2] - g) / 1000;
            tt[2] = (y[i * 2] + b) / 1000;

            tt[3] = (y[i * 2 + 1] + r) / 1000;
            tt[4] = (y[i * 2 + 1] - g) / 1000;
            tt[5] = (y[i * 2 + 1] + b) / 1000;

#pragma unroll
            for (int j = 0; j < 6; ++j) {
                tt1[j + k + i * 6] = lookupTable[tt[j]];
            }
        }
    }
}
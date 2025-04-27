#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void resizeBatchKernel(const uint16_t *p_Src, int nSrcPitch, int nSrcHeight, uint8_t *dpDst0, uint8_t *dpDst1, uint8_t *dpDst2, int nDstWidth, int nDstHeight, int *lookupTable_cuda) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;
    uint4 pF;
    int scale = nSrcHeight / nDstHeight;
    int nDstH = nDstHeight;

    if (scale == 4 || scale == 2 || scale == 6) {
        int nDstW = (scale == 4) ? nDstWidth / 6 : (scale == 6) ? nDstWidth / 2 : nDstWidth / 6;

        // Ensure thread is within the output dimensions
        if (tid < nDstW && tidd < nDstH) {
            int j = tidd * nSrcPitch * scale;
            int k = tid * ((scale == 4) ? 32 : (scale == 6) ? 16 : 16);

            if (scale == 4) {
                // Optimize data gathering by removing redundant memory loads
                pF.x = (uint32_t)p_Src[j + k + 0] + ((uint32_t)p_Src[j + k + 1] << 16);
                pF.w = (uint32_t)p_Src[j + k + 6];

                uint32_t v0 = (pF.x >> 20) & 0x3FF;
                uint32_t y0 = (pF.x >> 10) & 0x3FF;
                uint32_t u0 = pF.x & 0x3FF;
                uint32_t y1 = pF.w & 0x3FF;

                pF.y = (uint32_t)p_Src[j + k + 10] + ((uint32_t)p_Src[j + k + 11] << 16);
                pF.z = (uint32_t)p_Src[j + k + 12];

                uint32_t y2 = (pF.y >> 20) & 0x3FF;
                uint32_t u1 = (pF.y >> 10) & 0x3FF;
                uint32_t v1 = pF.z & 0x3FF;

                pF.x = (uint32_t)p_Src[j + k + 16] + ((uint32_t)p_Src[j + k + 17] << 16);
                pF.z = ((uint32_t)p_Src[j + k + 21] << 16);
                pF.w = (uint32_t)p_Src[j + k + 22] + ((uint32_t)p_Src[j + k + 23] << 16);

                uint32_t y3 = (pF.x >> 10) & 0x3FF;
                uint32_t u2 = (pF.z >> 20) & 0x3FF;
                uint32_t v2 = (pF.w >> 10) & 0x3FF;
                uint32_t y4 = pF.w & 0x3FF;

                pF.y = ((uint32_t)p_Src[j + k + 27] << 16);
                uint32_t y5 = (pF.y >> 20) & 0x3FF;

                k = tid * 6;
                j = tidd * nDstWidth;
                dpDst0[j + k + 0] = lookupTable_cuda[y0];
                dpDst0[j + k + 1] = lookupTable_cuda[y1];
                dpDst0[j + k + 2] = lookupTable_cuda[y2];
                dpDst0[j + k + 3] = lookupTable_cuda[y3];
                dpDst0[j + k + 4] = lookupTable_cuda[y4];
                dpDst0[j + k + 5] = lookupTable_cuda[y5];

                k = tid * 3;
                j = tidd * nDstWidth / 2;
                dpDst1[j + k + 0] = lookupTable_cuda[u0];
                dpDst1[j + k + 1] = lookupTable_cuda[u1];
                dpDst1[j + k + 2] = lookupTable_cuda[u2];
                dpDst2[j + k + 0] = lookupTable_cuda[v0];
                dpDst2[j + k + 1] = lookupTable_cuda[v1];
                dpDst2[j + k + 2] = lookupTable_cuda[v2];
            } else if (scale == 6) {
                // Similar optimization for scale == 6
                pF.x = (uint32_t)p_Src[j + k + 0] + ((uint32_t)p_Src[j + k + 1] << 16);

                uint32_t v0 = (pF.x >> 20) & 0x3FF;
                uint32_t y0 = (pF.x >> 10) & 0x3FF;
                uint32_t u0 = pF.x & 0x3FF;

                pF.x = (uint32_t)p_Src[j + k + 8] + ((uint32_t)p_Src[j + k + 9] << 16);

                uint32_t y1 = (pF.x >> 10) & 0x3FF;

                k = tid * 2;
                j = tidd * nDstWidth;
                dpDst0[j + k + 0] = lookupTable_cuda[y0];
                dpDst0[j + k + 1] = lookupTable_cuda[y1];
                k = tid;
                j = tidd * nDstWidth / 2;
                dpDst1[j + k + 0] = lookupTable_cuda[u0];
                dpDst2[j + k + 1] = lookupTable_cuda[v0];
            } else if (scale == 2) {
                // Optimize data gathering for scale == 2
                pF.x = (uint32_t)p_Src[j + k + 0] + ((uint32_t)p_Src[j + k + 1] << 16);
                pF.y = ((uint32_t)p_Src[j + k + 3] << 16);
                pF.z = ((uint32_t)p_Src[j + k + 5] << 16);
                pF.w = (uint32_t)p_Src[j + k + 6] + ((uint32_t)p_Src[j + k + 7] << 16);

                uint32_t v0 = (pF.x >> 20) & 0x3FF;
                uint32_t y0 = (pF.x >> 10) & 0x3FF;
                uint32_t u0 = pF.x & 0x3FF;
                uint32_t y1 = (pF.y >> 20) & 0x3FF;
                uint32_t u1 = (pF.z >> 20) & 0x3FF;
                uint32_t v1 = (pF.w >> 10) & 0x3FF;
                uint32_t y2 = pF.w & 0x3FF;

                pF.x = (uint32_t)p_Src[j + k + 8] + ((uint32_t)p_Src[j + k + 9] << 16);
                pF.y = (uint32_t)p_Src[j + k + 10] + ((uint32_t)p_Src[j + k + 11] << 16);
                pF.z = (uint32_t)p_Src[j + k + 12];
                pF.w = (uint32_t)p_Src[j + k + 14];

                uint32_t y3 = (pF.x >> 10) & 0x3FF;
                uint32_t y4 = (pF.y >> 20) & 0x3FF;
                uint32_t u2 = (pF.y >> 10) & 0x3FF;
                uint32_t v2 = pF.z & 0x3FF;
                uint32_t y5 = pF.w & 0x3FF;

                k = tid * 6;
                j = tidd * nDstWidth;
                dpDst0[j + k + 0] = lookupTable_cuda[y0];
                dpDst0[j + k + 1] = lookupTable_cuda[y1];
                dpDst0[j + k + 2] = lookupTable_cuda[y2];
                dpDst0[j + k + 3] = lookupTable_cuda[y3];
                dpDst0[j + k + 4] = lookupTable_cuda[y4];
                dpDst0[j + k + 5] = lookupTable_cuda[y5];

                k = tid * 3;
                j = tidd * nDstWidth / 2;
                dpDst1[j + k + 0] = lookupTable_cuda[u0];
                dpDst1[j + k + 1] = lookupTable_cuda[u1];
                dpDst1[j + k + 2] = lookupTable_cuda[u2];
                dpDst2[j + k + 0] = lookupTable_cuda[v0];
                dpDst2[j + k + 1] = lookupTable_cuda[v1];
                dpDst2[j + k + 2] = lookupTable_cuda[v2];
            }
        }
    }
}
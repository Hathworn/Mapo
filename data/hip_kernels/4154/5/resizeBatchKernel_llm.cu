#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized Kernel Function
__global__ static void resizeBatchKernel(const uint16_t *p_Src, int nSrcPitch, int nSrcHeight, uint8_t *dpDst0, uint8_t *dpDst1, uint8_t *dpDst2, int nDstWidth, int nDstHeight, int *lookupTable_cuda) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;
    int scale = nSrcHeight / nDstHeight;
    int nDstH = nDstHeight;
    int nDstW = (scale == 6) ? nDstWidth / 2 : nDstWidth / 6;

    if (tid < nDstW && tidd < nDstH) {
        int j = tidd * nSrcPitch * scale;
        int k = tid * ((scale == 6) ? 16 : 32);

        uint32_t v0, y0, u0, y1, u1, v1, y2, y3, y4, y5;
        
        uint4 pF;
        // Common variable loading and calculation
        pF.x = (uint32_t)p_Src[j + k + 0] + ((uint32_t)p_Src[j + k + 1] << 16);

        if (scale == 4 || scale == 2) {
            pF.w = (uint32_t)p_Src[j + k + 6];
            v0 = (pF.x & 0x3FF00000) >> 20;
            y0 = (pF.x & 0x000FFC00) >> 10;
            u0 = pF.x & 0x000003FF;
            y1 = pF.w & 0x000003FF;

            // Further processing based on scale
            if (scale == 4) {
                pF.y = (uint32_t)p_Src[j + k + 10] + ((uint32_t)p_Src[j + k + 11] << 16);
                pF.z = (uint32_t)p_Src[j + k + 12];

                y2 = (pF.y & 0x3FF00000) >> 20;
                u1 = (pF.y & 0x000FFC00) >> 10;
                v1 = pF.z & 0x000003FF;

                pF.x = (uint32_t)p_Src[j + k + 16] + ((uint32_t)p_Src[j + k + 17] << 16);
                pF.z = ((uint32_t)p_Src[j + k + 21] << 16);
                pF.w = (uint32_t)p_Src[j + k + 22] + ((uint32_t)p_Src[j + k + 23] << 16);

                y3 = (pF.x & 0x000FFC00) >> 10;
                uint32_t u2 = (pF.z & 0x3FF00000) >> 20;
                uint32_t v2 = (pF.w & 0x000FFC00) >> 10;
                y4 = pF.w & 0x000003FF;
                pF.y = ((uint32_t)p_Src[j + k + 27] << 16);
                y5 = (pF.y & 0x3FF00000) >> 20;

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
            } else { // scale == 2
                pF.y = ((uint32_t)p_Src[j + k + 3] << 16);
                pF.z = ((uint32_t)p_Src[j + k + 5] << 16);
                v1 = (pF.w & 0x000FFC00) >> 10;
                y2 = pF.w & 0x000003FF;
                y1 = (pF.y & 0x3FF00000) >> 20;
                u1 = (pF.z & 0x3FF00000) >> 20;

                pF.x = (uint32_t)p_Src[j + k + 8] + ((uint32_t)p_Src[j + k + 9] << 16);
                y3 = (pF.x & 0x000FFC00) >> 10;
                y4 = (uint32_t)(((uint32_t)p_Src[j + k + 10] + ((uint32_t)p_Src[j + k + 11] << 16) & 0x3FF00000) >> 20);
                uint32_t u2 = (pF.x & 0x000FFC00) >> 10;
                uint32_t v2 = ((uint32_t)p_Src[j + k + 12] & 0x000003FF);
                y5 = ((uint32_t)p_Src[j + k + 14] & 0x000003FF);

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
        } else { // scale == 6
            v0 = (pF.x & 0x3FF00000) >> 20;
            y0 = (pF.x & 0x000FFC00) >> 10;
            u0 = pF.x & 0x000003FF;

            pF.x = (uint32_t)p_Src[j + k + 8] + ((uint32_t)p_Src[j + k + 9] << 16);
            y1 = (pF.x & 0x000FFC00) >> 10;

            k = tid * 2;
            j = tidd * nDstWidth;
            dpDst0[j + k + 0] = lookupTable_cuda[y0];
            dpDst0[j + k + 1] = lookupTable_cuda[y1];

            k = tid;
            j = tidd * nDstWidth / 2;
            dpDst1[j + k + 0] = lookupTable_cuda[u0];
            dpDst2[j + k + 1] = lookupTable_cuda[v0];
        }
    }
}
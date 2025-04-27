#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void convertToP208Kernel(uint16_t *pV210, uint16_t *dP208, int nPitch, int nWidth, int nHeight) {
    // Calculate thread ids
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;

    // Constants and optimizations
    uint32_t pF[4];
    int nDstW = nPitch / 8;
    int nDstH = nHeight;

    // Ensure work is done only within bounds
    if (tid < nDstW && tidd < nDstH) {
        int k = tid * 8;
        int j = tidd * nPitch;
        
        // Optimize memory accesses, coalescing reads of pV210
        pF[0] = __ldg(&pV210[j + k + 0]) + ((uint32_t)__ldg(&pV210[j + k + 1]) << 16);
        pF[1] = __ldg(&pV210[j + k + 2]) + ((uint32_t)__ldg(&pV210[j + k + 3]) << 16);
        pF[2] = __ldg(&pV210[j + k + 4]) + ((uint32_t)__ldg(&pV210[j + k + 5]) << 16);
        pF[3] = __ldg(&pV210[j + k + 6]) + ((uint32_t)__ldg(&pV210[j + k + 7]) << 16);

        // Avoid redundant calculations
        uint32_t v0 = (pF[0] & 0x3FF00000) >> 20;
        uint32_t y0 = (pF[0] & 0x000FFC00) >> 10;
        uint32_t u0 = pF[0] & 0x000003FF;
        uint32_t y2 = (pF[1] & 0x3FF00000) >> 20;
        uint32_t u1 = (pF[1] & 0x000FFC00) >> 10;
        uint32_t y1 = pF[1] & 0x000003FF;
        uint32_t u2 = (pF[2] & 0x3FF00000) >> 20;
        uint32_t y3 = (pF[2] & 0x000FFC00) >> 10;
        uint32_t v1 = pF[2] & 0x000003FF;
        uint32_t y5 = (pF[3] & 0x3FF00000) >> 20;
        uint32_t v2 = (pF[3] & 0x000FFC00) >> 10;
        uint32_t y4 = pF[3] & 0x000003FF;

        // Improved indexing for dP208
        k = tid * 6;
        j = tidd * nPitch * 3 / 4;
        dP208[j + k + 0] = y0;
        dP208[j + k + 1] = y1;
        dP208[j + k + 2] = y2;
        dP208[j + k + 3] = y3;
        dP208[j + k + 4] = y4;
        dP208[j + k + 5] = y5;

        // Optimized loop for U and V values
        k = tid * 3;
        j = tidd * nPitch * 3 / 8 + nWidth * nHeight;
        dP208[j + k + 0] = u0;
        dP208[j + k + 1] = u1;
        dP208[j + k + 2] = u2;
        j = tidd * nPitch * 3 / 8 + nWidth * nHeight * 3 / 2;
        dP208[j + k + 0] = v0;
        dP208[j + k + 1] = v1;
        dP208[j + k + 2] = v2;
    }
}
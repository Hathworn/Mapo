#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void convertToP208Kernel(uint16_t *pV210, uint16_t *dP208, int nPitch, int nWidth, int nHeight) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;

    // Precompute often used values
    int nDstW = nPitch / 8;
    int nDstH = nHeight;

    // Check valid thread range
    if (tid < nDstW && tidd < nDstH) {
        uint32_t v0, y0, u0, y2, u1, y1, u2, y3, v1, y5, v2, y4;
        uint4 pF;
        
        // Calculate indices only once and reuse
        int k = tid * 8;
        int j = tidd * nPitch;

        // Read 210 pixels packed in 32-bit words
        pF.x = (uint32_t)pV210[j + k + 0] + ((uint32_t)pV210[j + k + 1] << 16);
        pF.y = (uint32_t)pV210[j + k + 2] + ((uint32_t)pV210[j + k + 3] << 16);
        pF.z = (uint32_t)pV210[j + k + 4] + ((uint32_t)pV210[j + k + 5] << 16);
        pF.w = (uint32_t)pV210[j + k + 6] + ((uint32_t)pV210[j + k + 7] << 16);

        // Unpack the values
        v0 = (pF.x >> 20) & 0x3FF;
        y0 = (pF.x >> 10) & 0x3FF;
        u0 = pF.x & 0x3FF;
        y2 = (pF.y >> 20) & 0x3FF;
        u1 = (pF.y >> 10) & 0x3FF;
        y1 = pF.y & 0x3FF;
        u2 = (pF.z >> 20) & 0x3FF;
        y3 = (pF.z >> 10) & 0x3FF;
        v1 = pF.z & 0x3FF;
        y5 = (pF.w >> 20) & 0x3FF;
        v2 = (pF.w >> 10) & 0x3FF;
        y4 = pF.w & 0x3FF;

        // Simplify memory stores using coalesced access patterns
        k = tid * 6;
        j = tidd * (nPitch * 3 / 4);
        dP208[j + k + 0] = y0;
        dP208[j + k + 1] = y1;
        dP208[j + k + 2] = y2;
        dP208[j + k + 3] = y3;
        dP208[j + k + 4] = y4;
        dP208[j + k + 5] = y5;

        k = tid * 3;
        j = tidd * (nPitch * 3 / 8) + nWidth * nHeight;
        dP208[j + k + 0] = u0;
        dP208[j + k + 1] = u1;
        dP208[j + k + 2] = u2;

        j = tidd * (nPitch * 3 / 8) + nWidth * nHeight * 3 / 2;
        dP208[j + k + 0] = v0;
        dP208[j + k + 1] = v1;
        dP208[j + k + 2] = v2;
    }
}
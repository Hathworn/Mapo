```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void convertToRGBKernel(const uint16_t *pV210, uint16_t *tt, int nSrcWidth, int nDstWidth, int nDstHeight) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int tidd = blockIdx.y * blockDim.y + threadIdx.y;
    uint32_t v0, y0, u0, y2, u1, y1, u2, y3, v1, y5, v2, y4;
    uint4 pF;

    if (tid < (nSrcWidth / 8) && tidd < nDstHeight) {
        int j = tidd * nSrcWidth;
        int k = tid * 8;
        
        // Use float2 to load data for better performance
        float2 p0 = *reinterpret_cast<const float2*>(&pV210[j + k]);
        float2 p1 = *reinterpret_cast<const float2*>(&pV210[j + k + 4]);
        
        pF.x = __float2uint_rz(p0.x * 65536.0f);
        pF.y = __float2uint_rz(p0.y * 65536.0f);
        pF.z = __float2uint_rz(p1.x * 65536.0f);
        pF.w = __float2uint_rz(p1.y * 65536.0f);

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

        k = tid * 18;
        j = (j * 9) / 4;

        // Pre-compute conversion factors
        int r = 1407 * v0 - 720384, g = 716 * v0 + 345 * u0 - 543232, b = 1779 * u0 - 910848;
        int outIdx = j + k;
        
        // Use loop unrolling for better performance
        tt[outIdx] = (y0 + r) / 1000;
        tt[outIdx + 1] = (y0 - g) / 1000;
        tt[outIdx + 2] = (y0 + b) / 1000;
        
        tt[outIdx + 3] = (y1 + r) / 1000;
        tt[outIdx + 4] = (y1 - g) / 1000;
        tt[outIdx + 5] = (y1 + b) / 1000;

        r = 1407 * v1 - 720384;
        g = 716 * v1 + 345 * u1 - 543232;
        b = 1779 * u1 - 910848;
        
        tt[outIdx + 6] = (y2 + r) / 1000;
        tt[outIdx + 7] = (y2 - g) / 1000;
        tt[outIdx + 8] = (y2 + b) / 1000;
        
        tt[outIdx + 9] = (y3 + r) / 1000;
        tt[outIdx + 10] = (y3 - g) / 1000;
        tt[outIdx + 11] = (y3 + b) / 1000;

        r = 1407 * v2 - 720384;
        g = 716 * v2 + 345 * u2 - 543232;
        b = 1779 * u2 - 910848;
        
        tt[outIdx + 12] = (y4 + r) / 1000;
        tt[outIdx + 13] = (y4 - g) / 1000;
        tt[outIdx + 14] = (y4 + b) / 1000;

        tt[outIdx + 15] = (y5 + r) / 1000;
        tt[outIdx + 16] = (y5 - g) / 1000;
        tt[outIdx + 17] = (y5 + b) / 1000;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_mix32_1(int64_t * ip, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples, uint16_t * shiftUV, int32_t mixres, uint32_t mask, int32_t m2, int32_t mixbits, int32_t shift)
{
    int z = threadIdx.x + blockIdx.x * blockDim.x;
    if (z < numSamples)
    {
        int32_t l, r;
        int32_t k = z * 2;

        // Fetch input more efficiently
        int64_t temp = ip[z * stride]; 

        // Split into l and r
        l = (int32_t)temp;
        r = (int32_t)(temp >> 32);

        // Capture shiftUV with direct application of mask
        shiftUV[k] = (uint16_t)(l & mask);
        shiftUV[k + 1] = (uint16_t)(r & mask);

        // Pre-calculate shifts
        l >>= shift;
        r >>= shift;

        // Use fused multiply-add for computation
        u[z] = __fma_rn(mixres, l, m2 * r) >> mixbits;
        v[z] = l - r;
    }
}
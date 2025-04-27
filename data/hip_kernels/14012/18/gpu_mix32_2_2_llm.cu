#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_mix32_2_2(int64_t * ip, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples, uint16_t * shiftUV, uint32_t mask, int32_t shift)
{
    int z = threadIdx.x + blockIdx.x * blockDim.x;
    // Ensure that only valid threads work
    if (z < numSamples)
    {
        int32_t l, r;
        int32_t k = z * 2;
        int64_t temp = ip[z];

        // Reduce overflow risk by masking first
        shiftUV[k] = (uint16_t)(temp & mask); // Optimize indexing with single access
        shiftUV[k + 1] = (uint16_t)((temp >> 32) & mask);

        // Perform bit-shift operation after masking
        u[z] = (int32_t)(temp >> shift);
        v[z] = (int32_t)((temp >> 32) >> shift);
    }
}
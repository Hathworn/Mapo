```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_mix20_2(uint8_t * ip, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples)
{
    int z = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if index is within bounds
    if (z < numSamples)
    {
        int32_t l, r;
        
        // Entrance pointer incrementation logic adjusted for performance and clarity
        ip += z * (1 + stride) * 3;

        // Unroll left computation
        l = ((int32_t)ip[0] << 16) | ((int32_t)ip[1] << 8) | (int32_t)ip[2];
        u[z] = (l << 8) >> 12; // Optimized shift to emphasize computation

        // Incrementation for right channel data
        ip += 3;

        // Unroll right computation
        r = ((int32_t)ip[0] << 16) | ((int32_t)ip[1] << 8) | (int32_t)ip[2];
        v[z] = (r << 8) >> 12; // Optimized shift to emphasize computation
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UniformNormalDistribution(float *from, float *to, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified id calculation

    if (id < size)
    {
        // Combined calculations into fewer operations
        float tmp = normcdf(from[id] * rsqrtf((float)size)); 

        to[id] = (tmp - 0.5f) * 2.0f;
    }
}
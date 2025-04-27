#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UniformNormalDistribution(float *from, float *to, int size)
{
    // Calculate global thread ID
    int id = threadIdx.x + blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x);

    // Check bounds and compute
    if (id < size) 
    {
        // Precompute constant outside loop (in the calling code if possible)
        float factor = sqrtf((float)size);

        // Use temporary variable directly
        float tmp = normcdf(from[id] * factor);

        // Store result in output array
        to[id] = (tmp - 0.5f) * 2.0f;
    }
}
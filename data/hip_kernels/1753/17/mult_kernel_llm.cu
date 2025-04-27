#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_kernel(float* data, const float scale, const int realtc)
{
    // Calculate global thread index for the current thread
    const uint index = blockIdx.x * blockDim.x + threadIdx.x + (gridDim.x * blockDim.x * blockIdx.y);

    // Check within bounds and perform scaling operation
    if (index < realtc)
    {
        data[index] *= scale;
    }
}
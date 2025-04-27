#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void increment_kernel(int *g_data, int inc_value)
{
    // Calculate index within grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if idx is within bounds to avoid accessing out of range
    if (idx < gridDim.x * blockDim.x)
    {
        g_data[idx] += inc_value; // Perform increment
    }
}
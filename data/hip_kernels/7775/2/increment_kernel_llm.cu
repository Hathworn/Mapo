#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void increment_kernel(int *g_data, int inc_value)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < gridDim.x * blockDim.x) // Ensure idx is within valid range
    {
        g_data[idx] += inc_value; // Simplified increment operation
    }
}
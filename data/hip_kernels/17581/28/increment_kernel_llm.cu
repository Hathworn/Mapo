#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void increment_kernel(int *g_data, int inc_value)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within the bounds to prevent memory access errors
    if (idx < gridDim.x * blockDim.x) {
        g_data[idx] += inc_value; // Simplified increment operation
    }
}
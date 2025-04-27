#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_touch(uint64_t *x, const size_t size)
{
    // Calculate global thread index
    const size_t i = blockIdx.x * blockDim.x + threadIdx.x; 
    
    // Only perform assignments if within bounds
    if (i < size)
    {
        x[i] = 0; // Set element to zero
    }
}
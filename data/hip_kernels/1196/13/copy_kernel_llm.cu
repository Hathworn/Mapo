#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(size_t sz, float_t* src, float_t* dest) 
{
    // Calculate global index
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    // Determine stride through grid of blocks
    size_t stride = blockDim.x * gridDim.x;

    // Use strided loop for optimal memory access
    for(size_t i = index; i < sz; i += stride) 
    {
        dest[i] = src[i];
    }
}
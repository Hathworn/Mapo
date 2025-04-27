#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dense_mv_add(size_t sz, float_t* src, float_t* dest)
{
    // Calculate global thread index
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use strided loop for better memory access pattern
    for (size_t i = index; i < sz; i += blockDim.x * gridDim.x) 
    {
        dest[i] += src[i];
    }
}
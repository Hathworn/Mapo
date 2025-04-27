#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void dense_mv_add(size_t sz, float_t* src, float_t* dest)
{
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < sz)
    {
        // Coalesced memory access
        dest[index] += src[index];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dense_add(size_t sz, float_t* src, float_t* dest)
{
    size_t destIndex = blockIdx.x * blockDim.x + threadIdx.x;
    if(destIndex < sz)
    {
        // Use 'destIndex' directly since 'srcIndex' always equals 'threadIdx.x'
        dest[destIndex] += src[threadIdx.x];
    }
}
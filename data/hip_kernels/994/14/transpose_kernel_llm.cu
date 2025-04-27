#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_kernel(size_t sz, float_t* src, float_t* dest, size_t ld_src, size_t ld_dest)
{
    size_t xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    size_t yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    size_t src_index = yIndex * ld_src + xIndex;
    size_t dest_index = xIndex * ld_dest + yIndex;

    // Check if the source index is within bounds
    if (src_index < sz) 
    {
        dest[dest_index] = src[src_index]; // Perform the transpose
    }
}
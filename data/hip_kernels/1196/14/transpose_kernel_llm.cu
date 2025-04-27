```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_kernel(size_t sz, float_t* src, float_t* dest, size_t ld_src, size_t ld_dest)
{
    // Calculate the linear index and convert to 2D grid indices
    size_t j = blockIdx.x * blockDim.x + threadIdx.x;
    size_t i = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check bounds to avoid invalid memory accesses
    if(i < ld_src && j < ld_dest && (j * ld_dest + i) < sz)
    {
        // Transpose the matrix element
        dest[j * ld_dest + i] = src[i * ld_src + j];
    }
}
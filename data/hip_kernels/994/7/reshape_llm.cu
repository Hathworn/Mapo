```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reshape(size_t num_values, float_t* src, float_t* dest, size_t ld_src, size_t ld_dest)
{
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < num_values)
    {
        // Improve memory access pattern by reducing computation inside.
        size_t row = index / ld_dest;
        size_t col = index % ld_dest;
        size_t src_index = row * ld_src + col;
        dest[index] = src[src_index];
    }
}
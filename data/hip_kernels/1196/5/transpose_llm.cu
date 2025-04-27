#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose(size_t sz, float_t* src, float_t* dest, size_t src_width, size_t src_height)
{
    // Calculate index using block and thread indices
    size_t index = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if computed index is within bounds
    if(index < sz)
    {
        // Calculate row (i) and column (j) in source matrix
        size_t i = index / src_width;
        size_t j = index % src_width;

        // Calculate transposed index for destination matrix
        size_t dest_index = j * src_height + i;

        // Perform transposition by assigning source to destination
        dest[dest_index] = src[index];
    }
}
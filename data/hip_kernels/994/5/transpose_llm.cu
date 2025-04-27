#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose(size_t sz, float_t* src, float_t* dest, size_t src_width, size_t src_height)
{
    // Calculate the index using block and thread indices for parallel execution
    size_t index = blockDim.x * blockIdx.x + threadIdx.x;

    if(index < sz)
    {
        // Use integer division and modulus for row-column conversion
        size_t i = index / src_width;
        size_t j = index % src_width;

        // Compute the destination index for transposed matrix
        size_t dest_index = j * src_height + i;
        
        // Assign value in transposed position
        dest[dest_index] = src[index];
    }
}
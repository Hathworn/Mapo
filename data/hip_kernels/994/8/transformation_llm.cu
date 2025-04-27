#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transformation(size_t num_values, float_t* src, float_t* dest, size_t ld_src, size_t ld_dest)
{
    // Calculate global thread index
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (index < num_values)
    {
        // Precompute reused values for optimization
        size_t block_idx = index / ld_src;
        size_t block_offset = (index % ld_src);
        size_t sub_block = block_offset % 8;
        size_t sub_offset = block_offset / 8;

        // Compute destination index
        size_t dest_index = block_idx * ld_src + sub_block * ld_dest + sub_offset;
        
        // Perform transformation
        dest[dest_index] = src[index];
    }
}
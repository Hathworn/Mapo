#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fractional_stride_nchw(size_t num_values, size_t stride, float_t* src, float_t* dest, size_t ld_src, size_t ld_dest)
{
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds before computation
    if (index < num_values)
    {
        // Use integer division and modulo to compute frame_id in one line
        size_t frame_id = (index / ld_src) * ld_dest + (stride * (index % ld_src));
        
        // Move data from source to destination for the calculated frame_id
        dest[frame_id] = src[index];
    }
}
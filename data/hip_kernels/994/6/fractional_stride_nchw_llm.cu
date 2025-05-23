#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fractional_stride_nchw(size_t num_values, size_t stride, float_t* src, float_t* dest, size_t ld_src, size_t ld_dest)
{
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < num_values)
    {
        // Optimize memory access using register to store computed frame_id
        size_t frame_id = (index / ld_src) * ld_dest + (stride * (index % ld_src));

        // Access using coalesced memory
        dest[frame_id] = src[index];
    }
}
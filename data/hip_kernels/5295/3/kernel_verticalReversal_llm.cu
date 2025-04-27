#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_verticalReversal(dev_t *src, dev_t *dst, uint pitch_src, uint pitch_dst, uint pixel_w, uint pixel_h)
{
    // Calculate global thread indices
    unsigned int dim_x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int dim_y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread is within image bounds
    if (dim_x < pixel_w && dim_y < pixel_h) {
        // Read and write using coalesced memory access
        size_t index_src = dim_y * pitch_src / 4 + dim_x;
        size_t index_dst = (pixel_h - 1 - dim_y) * pitch_dst / 4 + dim_x;
        uint32_t rgba = *((uint32_t*)src + index_src);
        *((uint32_t*)dst + index_dst) = rgba;
    }
}
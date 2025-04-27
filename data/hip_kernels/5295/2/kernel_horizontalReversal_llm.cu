#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_horizontalReversal(dev_t *src, dev_t *dst, uint pitch_src, uint pitch_dst, uint pixel_w, uint pixel_h)
{
    // Calculate the global index in x and y directions
    unsigned int dim_x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int dim_y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread is within bounds and perform reversal only when in bounds
    if (dim_x < pixel_w && dim_y < pixel_h) {
        // Load source pixel data
        uint32_t rgba = *((uint32_t*)((char*)src + dim_y * pitch_src) + dim_x);
        // Reverse and store in destination
        *((uint32_t*)((char*)dst + dim_y * pitch_dst) + (pixel_w - 1 - dim_x)) = rgba;
    }
}
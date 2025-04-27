#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_uint32_kernel_2(uint32_t *src, uint32_t *dst, int src_h, int src_w, int src_align, int dst_align)
{
    // Allocate shared memory for the tile and ensure alignment
    __shared__ uint32_t tmp[32][33]; // Use 2D array for better cache locality
    const int w_align = 33;

    // Calculate the aligned width to handle memory correctly
    const int src_w_align = (src_w + 31) & ~31; // Use bitwise to achieve alignment
    const int warps_in_width = src_w_align / 32;

    // Determine the local position of the thread within the block
    const int local_x = threadIdx.x & 31; // Use bitwise to reduce instruction count
    const int local_y = threadIdx.x >> 5; // Decompose threadIdx.x using bitwise

    // Determine the global position on the grid
    const int global_index = blockIdx.x;
    const int global_x_index = global_index % warps_in_width;
    const int global_y_index = global_index / warps_in_width;

    const int global_x = (global_x_index << 5) + local_x; // Use shift for multiplication by 32
    const int global_y = (global_y_index << 5) + local_y;

    // Load src into shared memory with boundary checks
    if (global_x < src_w && global_y < src_h) {
        tmp[local_y][local_x] = src[global_y * src_align + global_x];
    }
    __syncthreads();

    // Perform the transpose within shared memory
    const int new_global_x = (global_y_index << 5) + local_x;
    const int new_global_y = (global_x_index << 5) + local_y;

    // Store result back to the destination with boundary checks
    if (new_global_x < src_h && new_global_y < src_w) {
        dst[new_global_y * (dst_align / 32) + new_global_x] = tmp[local_x][local_y];
    }
}
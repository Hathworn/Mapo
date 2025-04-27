#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_uint32_kernel_2(uint32_t *src, uint32_t *dst, int src_h, int src_w, int src_align, int dst_align)
{
    // Adjust shared memory size for improved performance alignment
    __shared__ uint32_t tmp[32 * 32]; 
    const int w_align = 32; 

    const int src_w_align = src_w + (32 - src_w % 32);

    // Calculate thread and block indices
    const int local_x = threadIdx.x % 32;
    const int local_y = threadIdx.x / 32;

    const int global_index = blockIdx.x;
    const int global_x_index = global_index % (src_w_align / 32);
    const int global_y_index = global_index / (src_w_align / 32);
    
    const int global_x = global_x_index * 32 + local_x;
    const int global_y = global_y_index * 32 + local_y;

    uint32_t val = 0;
    
    // Fetch data from global memory using conditional checks
    if (global_x < src_w && global_y < src_h) {
        val = src[global_y * src_align + global_x];
    }
    
    // Load data into shared memory with adjusted indices
    tmp[local_y * w_align + local_x] = val;
    __syncthreads();
    val = tmp[local_x * w_align + local_y];

    const int new_global_x = global_y_index * 32 + local_x;
    const int new_global_y = global_x_index * 32 + local_y;

    // Store result back into global memory
    if (new_global_x < src_h && new_global_y < src_w) {
        dst[new_global_y * (dst_align / 32) + new_global_x] = val;
    }
}
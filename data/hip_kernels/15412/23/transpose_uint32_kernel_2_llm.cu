```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transpose_uint32_kernel_2(uint32_t *src, uint32_t *dst, int src_h, int src_w, int src_align, int dst_align)
{
    __shared__ uint32_t tmp[33 * 32];  // Shared memory for transposing

    int local_x = threadIdx.x % 32;    // Local x within a warp
    int local_y = threadIdx.x / 32;    // Local y within a warp
    int global_index = blockIdx.x;
    int global_x_index = global_index % (src_w / 32);
    int global_y_index = global_index / (src_w / 32);

    int global_x = global_x_index * 32 + local_x;
    int global_y = global_y_index * 32 + local_y;

    uint32_t val = 0;
    if (global_x < src_w && global_y < src_h) {
        val = src[global_y * src_align + global_x];
    }
    tmp[local_x * 33 + local_y] = val;  // Efficient shared memory access
    __syncthreads();
    
    val = tmp[local_y * 33 + local_x];  // Access transposed data
    
    int new_global_x = global_y_index * 32 + local_x;
    int new_global_y = global_x_index * 32 + local_y;

    if (new_global_x < src_h && new_global_y < src_w) {
        dst[new_global_y * (dst_align / 32) + new_global_x] = val;
    }
}
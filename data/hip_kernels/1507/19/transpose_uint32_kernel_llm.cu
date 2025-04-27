#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_uint32_kernel(uint32_t *src, uint32_t *dst, int src_h, int src_w, int src_align, int dst_align)
{
    // Calculate the column and row for current thread
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure threads are within bounds
    if (j < src_w && i < src_h) {
        // Perform transpose using aligned indices
        dst[j * (dst_align / sizeof(uint32_t)) + i] = src[i * (src_align / sizeof(uint32_t)) + j];
    }
}
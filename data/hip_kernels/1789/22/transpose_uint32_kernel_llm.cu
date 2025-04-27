#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_uint32_kernel(uint32_t *src, uint32_t *dst, int src_h, int src_w, int src_align, int dst_align)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Determine row and column from index
    int i = index % src_h;
    int j = index / src_h;

    // Perform write only if within bounds
    if (j < src_w)
    {
        // Improved memory access pattern by reusing calculated index
        dst[j * (dst_align / 32) + i] = src[i * src_align + j];
    }
}
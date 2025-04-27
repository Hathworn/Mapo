#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transpose_uint32_kernel(uint32_t *src, uint32_t *dst, int src_h, int src_w, int src_align, int dst_align)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Compute (i, j) for current thread
    int j = index / src_h;  // Calculate column index
    int i = index % src_h;  // Calculate row index

    // Ensure within bounds
    if (j < src_w)
    {
        // Perform transposition
        dst[j * dst_align / 32 + i] = src[i * src_align + j];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transpose_uint32_kernel(uint32_t *src, uint32_t *dst, int src_h, int src_w, int src_align, int dst_align)
{
    // Calculate global 1D index for the current thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate row (i) and column (j) indices based on the global index
    int i = index % src_h;
    int j = index / src_h;

    // Ensure that column index (j) is within bounds
    if (j < src_w)
    {
        // Perform the transpose operation
        dst[j * dst_align / 32 + i] = src[i * src_align + j];
    }
}
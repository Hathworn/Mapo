#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_uint32_kernel(uint32_t *src, uint32_t *dst, int src_h, int src_w, int src_align, int dst_align)
{
    // Calculate global index based on block and thread IDs
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate row and column from 1D index
    int i = index % src_h;
    int j = index / src_h;

    // Ensure that the column is within bounds
    if (j < src_w)
    {
        // Perform the transposition while adhering to alignment
        dst[j * (dst_align / 32) + i] = src[i * src_align + j];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_uint32_kernel(uint32_t *src, uint32_t *dst, int src_h, int src_w, int src_align, int dst_align)
{
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate row and column indices
    int i = index % src_h;
    int j = index / src_h;

    // Check bounds and perform transposition
    if (j < src_w && i < src_h) 
    {
        // Optimize memory access by aligning indices correctly
        dst[j * dst_align / 32 + i] = src[i * src_align + j];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TransposeKernelSimple(const uint8_t *src, uint8_t *dst, int width, int height)
{
    // Calculate transposed index for coalesced memory access
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Optimize memory access by checking bounds
    if (x < width && y < height)
    {
        int src_index = y * width + x;  // Row-major order calculation
        int dst_index = x * height + y; // Transpose calculation
        dst[dst_index] = src[src_index];
    }
}
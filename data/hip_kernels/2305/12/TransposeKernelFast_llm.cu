#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TransposeKernelFast(const uint8_t *src, uint8_t *dst, int width, int height)
{
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int xbase = blockIdx.x * blockDim.x;
    int ybase = blockIdx.y * blockDim.y;

    // Use shared memory with minimal padding to avoid bank conflicts
    __shared__ uint8_t sbuf[16][16];

    // Read data from global memory into shared memory
    int x = xbase + tx;
    int y = ybase + ty;
    if (x < width && y < height)
        sbuf[ty][tx] = src[x + y * width];

    __syncthreads();

    // Write transposed data from shared memory to global memory
    x = ybase + tx;
    y = xbase + ty;
    if (x < height && y < width)
        dst[y + x * height] = sbuf[tx][ty];
}
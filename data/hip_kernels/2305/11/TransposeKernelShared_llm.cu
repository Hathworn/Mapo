#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TransposeKernelShared(const uint8_t *src, uint8_t *dst, int width, int height) 
{
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int xbase = blockIdx.x * blockDim.x;
    int ybase = blockIdx.y * blockDim.y;

    // Use shared memory buffer for coalesced read and write
    __shared__ uint8_t sbuf[16][17]; // Padding for avoiding bank conflicts

    int x = xbase + tx;
    int y = ybase + ty;

    // Load from global memory to shared memory
    if (x < width && y < height) {
        sbuf[ty][tx] = src[x + y * width];
    }

    __syncthreads();

    // Transpose and store from shared memory to global memory
    x = xbase + ty;
    y = ybase + tx;
    if (x < height && y < width) {
        dst[y + x * height] = sbuf[tx][ty];
    }
}
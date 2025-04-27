#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TransposeKernelFast2(const uint8_t *src, uint8_t *dst, int width, int height)
{
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int xbase = blockIdx.x * 32;
    int ybase = blockIdx.y * 32;

    __shared__ uint8_t sbuf[32][32 + 4];

    // Load data from global memory to shared memory
    {
        int x = xbase + tx;
        int yend = min(ybase + 32, height);
        if (x < width) {
            #pragma unroll  // Unroll the loop to improve performance
            for (int tyy = ty, y = ybase + ty; y < yend; tyy += 8, y += 8) {
                sbuf[tyy][tx] = src[x + y * width];
            }
        }
    }

    __syncthreads();

    // Store data from shared memory to global memory
    {
        int y = ybase + tx;
        int xend = min(xbase + 32, width);
        if (y < height) {
            #pragma unroll  // Unroll the loop to improve performance
            for (int tyy = ty, x = xbase + ty; x < xend; tyy += 8, x += 8) {
                dst[y + x * height] = sbuf[tx][tyy];
            }
        }
    }
}
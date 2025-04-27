#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReduceHKernelFast(const uint8_t *src, float *dst, int width, int height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int yInit = blockIdx.y * 128; // Initialize starting y based on blockIdx

    if (x < width) {
        float sum = 0;
        // Optimize: Use shared memory for intermediate sums
        __shared__ float sharedSum[128];

        // Initialize shared memory to zero
        sharedSum[threadIdx.x] = 0;

        // Loop through rows in chunks
        for (int y = yInit; y < height; y += 128) {
            int yend = min(y + 128, height); // Determine end of the current chunk
            for (int i = y; i < yend; ++i) {
                sharedSum[threadIdx.x] += src[x + i * width];
            }
        }

        // Perform a single atomic add after accumulation
        atomicAdd(&dst[x], sharedSum[threadIdx.x]);
    }
}
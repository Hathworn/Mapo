#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReduceWKernelSimple(const uint8_t *src, float *dst, int width, int height)
{
    int y = blockIdx.x * blockDim.x + threadIdx.x;
    int x = blockIdx.y * 128;

    if (y < height) {
        float sum = 0;
        // Optimize loop to avoid recomputing index each iteration
        int offset = y * width;
        int xend = min(x + 128, width);
        for (int i = x; i < xend; ++i) {
            sum += src[i + offset];
        }
        atomicAdd(&dst[y], sum);
    }
}
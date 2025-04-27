#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReduceHKernelSimple(const uint8_t *src, float *dst, int width, int height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;  // Calculate stride
    float sum = 0;

    // Unroll the loop and stride across the grid to utilize global memory efficiently.
    for (int y = 0; y < height; y += stride) {
        if (x + y * width < width * height) {
            sum += src[x + y * width];
        }
    }

    // Safely write the sum to the output
    if (x < width) {
        dst[x] = sum;
    }
}
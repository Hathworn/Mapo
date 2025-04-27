#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void invertCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate global thread ID
    const uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds before inverting the pixel value
    if (x < width && y < height) {
        out[y * rowSizeOut + x] = ~in[y * rowSizeIn + x];
    }
}
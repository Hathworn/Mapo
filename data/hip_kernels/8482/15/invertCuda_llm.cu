#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void invertCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate global thread ID
    const uint32_t index = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t stride = blockDim.x * gridDim.x;

    // Process each pixel in this thread's range
    for (uint32_t i = index; i < width * height; i += stride) {
        uint32_t x = i % width;
        uint32_t y = i / width;
        if (x < width && y < height) {
            out[y * rowSizeOut + x] = ~in[y * rowSizeIn + x];
        }
    }
}
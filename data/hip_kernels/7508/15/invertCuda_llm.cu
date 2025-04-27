#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void invertCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Optimized: Reading and writing data column-wise to improve memory coalescing
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if (x < width && y < height) {
        const uint32_t inputIndex = y * rowSizeIn + x;
        const uint32_t outputIndex = y * rowSizeOut + x;
        out[outputIndex] = ~in[inputIndex];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flipCuda(const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height, bool horizontal, bool vertical)
{
    // Calculate input coordinates using improved indexing
    const uint32_t inX = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t inY = blockIdx.y * blockDim.y + threadIdx.y;

    // Bounds check for in-bounds coordinates
    if (inX < width && inY < height) {
        // Conditional assignment for output coordinates
        const uint32_t outX = horizontal ? (width - 1 - inX) : inX;
        const uint32_t outY = vertical ? (height - 1 - inY) : inY;

        // Efficient memory access pattern
        out[outY * rowSizeOut + outX] = in[inY * rowSizeIn + inX];
    }
}
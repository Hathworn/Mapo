#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void flipCuda(const uint8_t* __restrict__ in, uint32_t rowSizeIn, uint8_t* __restrict__ out, uint32_t rowSizeOut, uint32_t width, uint32_t height, bool horizontal, bool vertical)
{
    // Calculate input coordinates
    const uint32_t inX = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t inY = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure threads operate only within bounds
    if (inX < width && inY < height) {
        // Compute corresponding output coordinates using conditional operators
        const uint32_t outX = horizontal ? (width - 1 - inX) : inX;
        const uint32_t outY = vertical   ? (height - 1 - inY) : inY;

        // Perform the pixel flipping
        out[outY * rowSizeOut + outX] = in[inY * rowSizeIn + inX];
    }
}
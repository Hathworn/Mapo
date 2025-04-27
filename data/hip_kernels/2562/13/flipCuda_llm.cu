```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flipCuda(const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height, bool horizontal, bool vertical)
{
    // Cache block and thread indices
    const uint32_t inX = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t inY = blockDim.y * blockIdx.y + threadIdx.y;

    // Check bounds
    if (inX < width && inY < height) {
        // Calculate output coordinates
        const uint32_t outX = horizontal ? (width - 1 - inX) : inX;
        const uint32_t outY = vertical ? (height - 1 - inY) : inY;

        // Perform memory transfer with calculated indices
        out[outY * rowSizeOut + outX] = in[inY * rowSizeIn + inX];
    }
}

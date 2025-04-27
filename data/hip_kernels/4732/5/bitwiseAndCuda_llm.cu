#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitwiseAndCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate unique thread index
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Check within bounds
    if (x < width && y < height) {
        // Compute index once and reuse
        const uint32_t yOffsetIn1 = y * rowSizeIn1;
        const uint32_t yOffsetIn2 = y * rowSizeIn2;
        const uint32_t yOffsetOut = y * rowSizeOut;
        const uint32_t idIn1 = yOffsetIn1 + x;
        const uint32_t idIn2 = yOffsetIn2 + x;
        const uint32_t idOut = yOffsetOut + x;

        // Perform bitwise and operation
        out[idOut] = in1[idIn1] & in2[idIn2];
    }
}
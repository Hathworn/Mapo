#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void lookupTableCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height, uint8_t *table)
{
    // Calculate x and y indices
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure within bounds
    if (x < width && y < height)
    {
        // Optimize memory access
        uint32_t inIdx = y * rowSizeIn + x;
        uint32_t outIdx = y * rowSizeOut + x;

        out[outIdx] = table[in[inIdx]];
    }
}
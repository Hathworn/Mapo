#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lookupTableCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height, uint8_t *table)
{
    // Calculate global thread ID
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure the thread operates within the image boundaries
    if (x < width && y < height) {
        // Compute linear index for input and output arrays
        const uint32_t inIndex = y * rowSizeIn + x;
        const uint32_t outIndex = y * rowSizeOut + x;

        // Map input value through lookup table to output
        out[outIndex] = table[in[inIndex]];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lookupTableCuda(const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height, uint8_t * table)
{
    // Calculate global thread ID
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Check bounds and perform lookup
    if (x < width && y < height) {
        // Direct index calculations for increased readability
        uint32_t indexIn = y * rowSizeIn + x;
        uint32_t indexOut = y * rowSizeOut + x;
        out[indexOut] = table[in[indexIn]];
    }
}
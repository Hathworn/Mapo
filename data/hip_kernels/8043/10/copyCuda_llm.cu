#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Compute x and y coordinates
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Check if coordinates are within bounds before performing the copy
    if (x < width && y < height) {
        // Perform data copy
        out[y * rowSizeOut + x] = in[y * rowSizeIn + x];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void invertCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate global thread ID
    const uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread coordinates are within image bounds
    if (x < width && y < height) {
        // Compute linear index for row-major order access and invert pixel
        const uint32_t indexIn = y * rowSizeIn + x;
        const uint32_t indexOut = y * rowSizeOut + x;
        out[indexOut] = ~in[indexIn];
    }
}
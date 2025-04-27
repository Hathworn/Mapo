#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height) {
    // Calculate the global thread index for this dimension.
    const uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread is within bounds before copying.
    if (x < width && y < height) {
        // Use efficient memory copy for each pixel.
        out[y * rowSizeOut + x] = in[y * rowSizeIn + x];
    }
}
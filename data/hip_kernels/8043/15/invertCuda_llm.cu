#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void invertCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate the pixel index
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure we are within the bounds of the image
    if (x < width && y < height)
    {
        // Perform the inversion
        out[y * rowSizeOut + x] = ~in[y * rowSizeIn + x];
    }
}
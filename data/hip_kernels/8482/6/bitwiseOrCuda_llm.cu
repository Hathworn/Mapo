#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitwiseOrCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure x and y are within bounds
    if (x < width && y < height)
    {
        const uint32_t idIn1 = y * rowSizeIn1 + x;
        const uint32_t idIn2 = y * rowSizeIn2 + x;

        // Use initial value
        uint8_t val = in1[idIn1] | in2[idIn2];

        // Store value directly to output
        out[y * rowSizeOut + x] = val;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void maximumCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate pixel coordinate
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Check bounds to avoid out-of-bounds memory access
    if (x < width && y < height) {
        // Directly calculate the index for all arrays
        const uint32_t indexIn1 = y * rowSizeIn1 + x;
        const uint32_t indexIn2 = y * rowSizeIn2 + x;
        const uint32_t indexOut = y * rowSizeOut + x;

        // Use ternary operator to find the maximum value
        out[indexOut] = (in1[indexIn1] > in2[indexIn2]) ? in1[indexIn1] : in2[indexIn2];
    }
}
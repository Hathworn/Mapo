#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void maximumCuda(const uint8_t* in1, uint32_t rowSizeIn1, const uint8_t* in2, uint32_t rowSizeIn2, uint8_t* out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate global thread index
    const uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to ensure threads operate within image dimensions
    if (x < width && y < height) {
        // Compute offset only once
        uint32_t offsetIn1 = y * rowSizeIn1 + x;
        uint32_t offsetIn2 = y * rowSizeIn2 + x;
        uint32_t offsetOut = y * rowSizeOut + x;

        // Assign maximum value to output
        out[offsetOut] = max(in1[offsetIn1], in2[offsetIn2]);
    }
}
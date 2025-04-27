#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitwiseAndCuda(const uint8_t* __restrict__ in1, uint32_t rowSizeIn1, const uint8_t* __restrict__ in2, uint32_t rowSizeIn2, uint8_t* __restrict__ out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate unique thread coordinates
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure thread is within image bounds
    if (x < width && y < height) {
        // Precompute index variables for simplicity
        const uint32_t idIn1 = y * rowSizeIn1 + x;
        const uint32_t idIn2 = y * rowSizeIn2 + x;
        const uint32_t idOut = y * rowSizeOut + x;

        // Perform bitwise AND operation
        out[idOut] = in1[idIn1] & in2[idIn2];
    }
}
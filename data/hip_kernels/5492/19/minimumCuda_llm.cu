```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void minimumCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate global index once
    const uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        // Combine operations to avoid multiple memory accesses
        const uint32_t indexIn1 = y * rowSizeIn1 + x;
        const uint32_t indexIn2 = y * rowSizeIn2 + x;
        const uint32_t indexOut = y * rowSizeOut + x;

        // Directly perform minimum computation
        out[indexOut] = min(in1[indexIn1], in2[indexIn2]);
    }
}
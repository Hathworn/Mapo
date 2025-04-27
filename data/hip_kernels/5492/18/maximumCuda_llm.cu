#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void maximumCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate global index once per thread
    uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure index doesn't exceed bounds
    if (x < width && y < height) {
        uint32_t indexIn1 = y * rowSizeIn1 + x;
        uint32_t indexIn2 = y * rowSizeIn2 + x;
        uint32_t indexOut = y * rowSizeOut + x;

        // Use max function for clarity
        out[indexOut] = max(in1[indexIn1], in2[indexIn2]);
    }
}
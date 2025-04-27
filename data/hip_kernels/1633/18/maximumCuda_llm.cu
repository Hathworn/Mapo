#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void maximumCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height) {
    // Calculate the global index for x and y efficiently
    const uint32_t x = threadIdx.x + blockIdx.x * blockDim.x;
    const uint32_t y = threadIdx.y + blockIdx.y * blockDim.y;

    // Perform bounds check to avoid out-of-bounds access
    if (x < width && y < height) {
        // Directly compute input and output indices
        const uint32_t indexIn1 = y * rowSizeIn1 + x;
        const uint32_t indexIn2 = y * rowSizeIn2 + x;
        const uint32_t indexOut = y * rowSizeOut + x;

        // Optimize the conditional assignment using in-place computation
        out[indexOut] = max(in1[indexIn1], in2[indexIn2]);
    }
}
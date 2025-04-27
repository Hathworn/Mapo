#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isEqualCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint32_t width, uint32_t height, uint32_t *isEqual) {
    // Calculate unique flattened index for each thread.
    const uint32_t idx = blockIdx.y * gridDim.x * blockDim.x + blockIdx.x * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x;

    // Check if index is within bounds.
    if (idx < width * height) {
        const uint32_t y = idx / width;
        const uint32_t x = idx % width;

        // Compare elements directly using the index.
        const uint32_t partsEqual = static_cast<uint32_t>(in1[y * rowSizeIn1 + x] == in2[y * rowSizeIn2 + x]);
        atomicAnd(isEqual, partsEqual);  // Ensure memory safety during concurrent updates.
    }
}
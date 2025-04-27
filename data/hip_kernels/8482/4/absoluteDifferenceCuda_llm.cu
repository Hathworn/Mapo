#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void absoluteDifferenceCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height) {
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure we process only within bounds
    if (x < width && y < height) {
        // Use a single calculation and remove dereference to optimize
        uint32_t idx1 = y * rowSizeIn1 + x; // Compute once, use index
        uint32_t idx2 = y * rowSizeIn2 + x;
        uint32_t idxOut = y * rowSizeOut + x;
        out[idxOut] = abs(in1[idx1] - in2[idx2]); // Use built-in abs function for clarity
    }
}
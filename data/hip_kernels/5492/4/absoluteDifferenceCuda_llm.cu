#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void absoluteDifferenceCuda(const uint8_t * __restrict__ in1, uint32_t rowSizeIn1, const uint8_t * __restrict__ in2, uint32_t rowSizeIn2, uint8_t * __restrict__ out, uint32_t rowSizeOut, uint32_t width, uint32_t height) 
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure thread is within bounds
    if (x < width && y < height) {
        // Calculate linear index
        const uint32_t idx1 = y * rowSizeIn1 + x;
        const uint32_t idx2 = y * rowSizeIn2 + x;
        const uint32_t idxOut = y * rowSizeOut + x;

        // Load input values and calculate the absolute difference
        const uint8_t val1 = in1[idx1];
        const uint8_t val2 = in2[idx2];
        out[idxOut] = (val1 > val2) ? (val1 - val2) : (val2 - val1);
    }
}
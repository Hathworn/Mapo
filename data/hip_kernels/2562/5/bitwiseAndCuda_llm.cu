#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitwiseAndCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate global thread index once, use register to minimize recalculation
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if (x < width && y < height) {
        // Precompute row index to reduce redundant computation
        const uint32_t rowIn1 = y * rowSizeIn1;
        const uint32_t rowIn2 = y * rowSizeIn2;
        const uint32_t rowOut = y * rowSizeOut;
        
        // Load and store memory with computed indices
        out[rowOut + x] = in1[rowIn1 + x] & in2[rowIn2 + x];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel using shared memory for better memory access patterns
__global__ void bitwiseOrCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if (x < width && y < height) {
        // Calculate index with pre-computed offset for performance
        const uint32_t yOffsetIn1 = y * rowSizeIn1;
        const uint32_t yOffsetIn2 = y * rowSizeIn2;
        const uint32_t yOffsetOut = y * rowSizeOut;
        
        // Compute the output using bitwise OR operation
        out[yOffsetOut + x] = in1[yOffsetIn1 + x] | in2[yOffsetIn2 + x];
    }
}
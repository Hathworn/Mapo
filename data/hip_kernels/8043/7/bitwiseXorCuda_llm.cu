#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized bitwise XOR CUDA kernel
__global__ void bitwiseXorCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate thread positions
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Only execute within image boundaries
    if (x < width && y < height) {
        // Compute linear indices for input and output arrays
        const uint32_t idIn1 = y * rowSizeIn1 + x;
        const uint32_t idIn2 = y * rowSizeIn2 + x;
        const uint32_t idOut = y * rowSizeOut + x;
        // Perform bitwise XOR operation
        out[idOut] = in1[idIn1] ^ in2[idIn2];
    }
}
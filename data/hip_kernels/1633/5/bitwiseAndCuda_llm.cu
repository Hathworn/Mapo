#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitwiseAndCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Cache block and thread index values for reuse
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Only compute if within bounds
    if (x < width && y < height) {
        // Compute linear index once
        const uint32_t rowIndex1 = y * rowSizeIn1;
        const uint32_t rowIndex2 = y * rowSizeIn2;
        const uint32_t rowIndexOut = y * rowSizeOut;
        
        // Perform bitwise and operation
        out[rowIndexOut + x] = in1[rowIndex1 + x] & in2[rowIndex2 + x];
    }
}
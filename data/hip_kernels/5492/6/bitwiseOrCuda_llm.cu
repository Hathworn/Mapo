#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitwiseOrCuda(const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Pre-calculate block and thread positions
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Compute single index for rowSize calculations
    const uint32_t index = y * rowSizeIn1 + x; 

    // Use thread-safe boundary checks and avoid unnecessary calculations
    if (x < width && y < height)
    {
        out[y * rowSizeOut + x] = in1[index] | in2[y * rowSizeIn2 + x];
    }
}
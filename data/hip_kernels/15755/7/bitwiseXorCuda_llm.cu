#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitwiseXorCuda( const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height )
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Check boundary conditions
    if ( x < width && y < height ) {
        const uint32_t idx = y * rowSizeOut + x;  // Use one index calculation for efficiency
        out[idx] = in1[y * rowSizeIn1 + x] ^ in2[y * rowSizeIn2 + x];  // Perform XOR operation
    }
}
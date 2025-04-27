#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitwiseXorCuda(const uint8_t* __restrict__ in1, uint32_t rowSizeIn1, const uint8_t* __restrict__ in2, uint32_t rowSizeIn2, uint8_t* __restrict__ out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate global thread ID
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Check if within bounds
    if (x < width && y < height) {
        // Calculate linear indices
        const uint32_t idIn1 = y * rowSizeIn1 + x;
        const uint32_t idIn2 = y * rowSizeIn2 + x;
        const uint32_t idOut = y * rowSizeOut + x;
        
        // Perform XOR
        out[idOut] = in1[idIn1] ^ in2[idIn2];
    }
}
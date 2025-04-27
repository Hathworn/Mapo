#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bitwiseOrCuda( const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height )
{
    // Calculate global thread ID
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure thread is within bounds of the image
    if (x < width && y < height) {
        const uint32_t idIn1 = y * rowSizeIn1 + x;
        const uint32_t idIn2 = y * rowSizeIn2 + x;
        const uint32_t idOut = y * rowSizeOut + x;
        
        // Perform bitwise OR operation
        out[idOut] = in1[idIn1] | in2[idIn2];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void minimumCuda( const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height )
{
    // Calculate global thread index
    const uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure within bounds
    if ( x < width && y < height ) {
        // Simplified pointer arithmetic with fewer operations
        uint32_t offset = y * rowSizeIn1 + x;
        const uint8_t * in1X = in1 + offset;               
        const uint8_t * in2X = in2 + offset;
        uint8_t * outX = out + offset;
        
        // Use of ternary operator for minimum calculation
        (*outX) = (*in1X < *in2X) ? *in1X : *in2X;
    }
}
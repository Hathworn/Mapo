#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitwiseAndCuda( const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height )
{
    // Calculate a single thread index
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Boundary check to ensure the thread falls within matrix dimensions
    if ( x < width && y < height ) {
        // Calculate linear memory indexes for input and output
        const uint32_t linearIndex = y * width + x;
        out[linearIndex] = in1[linearIndex] & in2[linearIndex];
    }
}
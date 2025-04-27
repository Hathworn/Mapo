#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCuda( const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height )
{
    // Calculate global thread ID for improved memory access
    const uint32_t idx = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t idy = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure within image bounds
    if ( idx < width && idy < height ) {
        const uint32_t inIndex = idy * rowSizeIn + idx;
        const uint32_t outIndex = idy * rowSizeOut + idx;
        // Direct copy from in to out
        out[outIndex] = in[inIndex];
    }
}
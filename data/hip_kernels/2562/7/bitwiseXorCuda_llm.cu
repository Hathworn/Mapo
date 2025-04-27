#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitwiseXorCuda( const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height )
{
    // Use a single variable for 2D to 1D mapping
    const uint32_t idx = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t idy = blockDim.y * blockIdx.y + threadIdx.y;

    // Combine conditionals for bounds checking
    if ( idx < width && idy < height ) {
        const uint32_t idOffsetIn1 = idy * rowSizeIn1 + idx;
        const uint32_t idOffsetIn2 = idy * rowSizeIn2 + idx;
        const uint32_t idOffsetOut = idy * rowSizeOut + idx;
        out[idOffsetOut] = in1[idOffsetIn1] ^ in2[idOffsetIn2];
    }
}
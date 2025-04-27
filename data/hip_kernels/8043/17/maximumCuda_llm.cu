#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void maximumCuda( const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height )
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if ( x < width && y < height ) {
        // Compute the input and output indices
        const uint32_t idx_in1 = y * rowSizeIn1 + x;
        const uint32_t idx_in2 = y * rowSizeIn2 + x;
        const uint32_t idx_out = y * rowSizeOut + x;

        // Perform the max operation directly on the elements
        out[idx_out] = max(in1[idx_in1], in2[idx_in2]);
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void minimumCuda( const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height )
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if ( x < width && y < height ) {
        const uint8_t in1Val = in1[y * rowSizeIn1 + x];
        const uint8_t in2Val = in2[y * rowSizeIn2 + x];
        out[y * rowSizeOut + x] = (in1Val < in2Val) ? in1Val : in2Val; // Use local variables to optimize memory access
    }
}
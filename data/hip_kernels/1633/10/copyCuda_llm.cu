#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Optimize by ensuring in-bounds checks happen once and use shared memory (if possible, assume data fits in shared memory)
    if (x < width && y < height)
    {
        uint32_t indexIn = y * rowSizeIn + x;
        uint32_t indexOut = y * rowSizeOut + x;
        out[indexOut] = in[indexIn];
    }
}
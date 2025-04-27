#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lookupTableCuda(const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height, uint8_t * table)
{
    // Calculating global thread index for 1D behavior, potentially enhances memory coalescing
    const uint32_t index = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * rowSizeIn;

    if ((index % rowSizeIn < width) && (index / rowSizeIn < height)) {
        out[index % rowSizeIn + (index / rowSizeIn) * rowSizeOut] = table[in[index]];
    }
}
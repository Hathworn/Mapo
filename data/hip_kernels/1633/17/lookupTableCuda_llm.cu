#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lookupTableCuda(const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height, uint8_t * table)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure the position is within bounds before accessing data
    if (x < width && y < height) {
        uint32_t in_index = y * rowSizeIn + x;    // Calculate input index
        uint32_t out_index = y * rowSizeOut + x;  // Calculate output index
        out[out_index] = table[in[in_index]];     // Apply lookup table
    }
}
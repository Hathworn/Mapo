#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lookupTableCuda(const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height, uint8_t * table)
{
    const uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;

    // Use shared memory to cache table values if possible (not used here as it's a global lookup)
    if (x < width && y < height) {
        // Lookup using table directly
        out[y * rowSizeOut + x] = table[in[y * rowSizeIn + x]];
    }
}
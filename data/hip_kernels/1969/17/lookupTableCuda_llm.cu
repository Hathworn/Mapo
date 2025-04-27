#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lookupTableCuda(const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height, const uint8_t * table)
{
    // Calculate global thread ID
    const uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure threads are within the matrix dimensions
    if (x < width && y < height) {
        // Load input value, access lookup table, and store in output
        const uint8_t value = in[y * rowSizeIn + x];
        out[y * rowSizeOut + x] = table[value];
    }
}
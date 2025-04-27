#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lookupTableCuda(const uint8_t* __restrict__ in, uint32_t rowSizeIn, uint8_t* __restrict__ out, uint32_t rowSizeOut, uint32_t width, uint32_t height, const uint8_t* __restrict__ table) {
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure threads operate within bounds
    if (x < width && y < height) {
        // Optimized memory access with restricted pointers and removed recalculations
        const uint32_t inputIndex = y * rowSizeIn + x;
        const uint32_t outputIndex = y * rowSizeOut + x;
        out[outputIndex] = table[in[inputIndex]];
    }
}
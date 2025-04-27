#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lookupTableCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height, uint8_t *table)
{
    // Calculate unique thread index
    const uint32_t idx = blockIdx.y * blockDim.y * rowSizeIn + blockIdx.x * blockDim.x;
    const uint32_t tid = threadIdx.y * rowSizeIn + threadIdx.x;

    const uint32_t index = idx + tid;

    // Check bounds
    if (index < width * height) {
        out[index] = table[in[index]];
    }
}
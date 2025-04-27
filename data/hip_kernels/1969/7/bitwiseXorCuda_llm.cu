#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitwiseXorCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate unique thread index
    const uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Use single memory access calculation per iteration
    if (x < width && y < height) {
        const uint32_t globalIdx = y * width + x;
        out[globalIdx] = in1[globalIdx] ^ in2[globalIdx];
    }
}
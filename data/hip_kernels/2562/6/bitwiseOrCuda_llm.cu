#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitwiseOrCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height) 
{
    // Calculate unique thread index
    const uint32_t tid = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t totalThreads = gridDim.x * blockDim.x;

    // Process multiple elements per thread
    for(uint32_t i = tid; i < width * height; i += totalThreads) {
        const uint32_t x = i % width;
        const uint32_t y = i / width;
        
        const uint32_t idIn1 = y * rowSizeIn1 + x;
        const uint32_t idIn2 = y * rowSizeIn2 + x;
        const uint32_t idOut = y * rowSizeOut + x;
        
        out[idOut] = in1[idIn1] | in2[idIn2];
    }
}
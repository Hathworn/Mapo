#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitwiseOrCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height) {
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Check if within bounds
    if (x < width && y < height) {
        // Calculate linear offsets once per thread
        const uint32_t baseIndexIn1 = y * rowSizeIn1;
        const uint32_t baseIndexIn2 = y * rowSizeIn2;
        const uint32_t baseIndexOut = y * rowSizeOut;
        
        out[baseIndexOut + x] = in1[baseIndexIn1 + x] | in2[baseIndexIn2 + x];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void isEqualCuda( const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint32_t width, uint32_t height, uint32_t * isEqual )
{
    // Optimize index calculation by using 1D grid with 2D array
    const uint32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t stride = blockDim.x * gridDim.x;
    
    for (uint32_t i = idx; i < width * height; i += stride) {
        const uint32_t x = i % width;
        const uint32_t y = i / width;
        const uint32_t partsEqual = static_cast<uint32_t>(in1[y * rowSizeIn1 + x] == in2[y * rowSizeIn2 + x]);
        atomicAnd(isEqual, partsEqual);
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isEqualCuda(const uint8_t* in1, uint32_t rowSizeIn1, const uint8_t* in2, uint32_t rowSizeIn2, uint32_t width, uint32_t height, uint32_t* isEqual)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if (x < width && y < height) {
        // Optimize by combining declaration and assignment
        uint32_t partsEqual = (in1[y * rowSizeIn1 + x] == in2[y * rowSizeIn2 + x]) ? 1 : 0;
        atomicAnd(isEqual, partsEqual);
    }
}
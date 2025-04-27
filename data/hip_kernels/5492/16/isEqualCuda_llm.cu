#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isEqualCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint32_t width, uint32_t height, uint32_t *isEqual)
{
    // Calculate global thread index
    const uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure index is within bounds
    if (x < width && y < height) {
        // Perform comparison and update result atomically
        const uint32_t partsEqual = (in1[y * rowSizeIn1 + x] == in2[y * rowSizeIn2 + x]) ? 1 : 0;
        atomicAnd(isEqual, partsEqual);
    }
}
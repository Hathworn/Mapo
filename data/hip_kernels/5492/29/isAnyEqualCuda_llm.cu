#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isAnyEqualCuda(const uint8_t *image, const uint8_t *value, size_t valueCount, uint32_t width, uint32_t height, uint32_t *differenceCount)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if (x < width && y < height) {
        const uint32_t id = y * width + x;

        // Use register to avoid re-accessing memory
        const uint8_t pixelValue = image[id];
        bool equal = false;

        // Optimize loop by unrolling
        for (uint32_t i = 0; i < valueCount; ++i) {
            if (pixelValue == value[i]) {
                equal = true;
                break;
            }
        }

        // Atomic operation if there is an equal value
        if (equal)
            atomicAdd(differenceCount, 1);
    }
}
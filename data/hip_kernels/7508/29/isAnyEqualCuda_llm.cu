#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void isAnyEqualCuda(const uint8_t * image, uint8_t * value, size_t valueCount, uint32_t width, uint32_t height, uint32_t * differenceCount)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure threads accessing image area within bounds
    if (x < width && y < height) {
        const uint32_t id = y * width + x;
        uint8_t pixelValue = image[id];

        // Unroll loop to reduce instruction overhead
        for (uint32_t i = 0; i < valueCount; i += 4) {
            if ((i < valueCount && pixelValue == value[i]) ||
                (i + 1 < valueCount && pixelValue == value[i + 1]) ||
                (i + 2 < valueCount && pixelValue == value[i + 2]) ||
                (i + 3 < valueCount && pixelValue == value[i + 3])) {
                atomicAdd(differenceCount, 1);
                return;  // Early return to avoid unnecessary further checks
            }
        }
    }
}
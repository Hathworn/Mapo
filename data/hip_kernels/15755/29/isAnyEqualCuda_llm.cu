#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isAnyEqualCuda(const uint8_t *image, const uint8_t *value, size_t valueCount, uint32_t width, uint32_t height, uint32_t *differenceCount)
{
    uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Early exit if out of bounds
    if (x >= width || y >= height) return;

    uint32_t id = y * width + x;
    uint8_t pixelValue = image[id];

    // Use shared memory for value array for faster access
    __shared__ uint8_t sharedValues[256]; // Assuming valueCount <= 256, adjust as needed
    if (threadIdx.x < valueCount) {
        sharedValues[threadIdx.x] = value[threadIdx.x];
    }
    __syncthreads();

    // Efficient search using shared memory
    bool equal = false;
    for (uint32_t i = 0; i < valueCount; ++i) {
        if (pixelValue == sharedValues[i]) {
            equal = true;
            break;
        }
    }

    // Atomic add only if equal is true
    if (equal) {
        atomicAdd(differenceCount, 1);
    }
}
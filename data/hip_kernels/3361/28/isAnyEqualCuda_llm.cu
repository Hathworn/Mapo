#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isAnyEqualCuda(const uint8_t *image, uint8_t *value, size_t valueCount, uint32_t width, uint32_t height, uint32_t *differenceCount)
{
    // Calculate global thread index
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Boundary check
    if (x < width && y < height) {
        const uint32_t id = y * width + x;
        uint8_t pixelValue = image[id];

        // Use shared memory for values to reduce global memory access
        __shared__ uint8_t sharedValues[256]; // assuming a reasonable size limit, can adjust as needed
        int threadCount = blockDim.x * blockDim.y;  // Total threads in block
        for (uint32_t i = threadIdx.x * blockDim.y + threadIdx.y; i < valueCount; i += threadCount) {
            sharedValues[i] = value[i];
        }

        __syncthreads();

        // Check equality
        bool equal = false;
        for (uint32_t i = 0; i < valueCount; ++i) {
            if (pixelValue == sharedValues[i]) {
                equal = true;
                break;
            }
        }

        // Atomic increment if equal
        if (equal) {
            atomicAdd(differenceCount, 1);
        }
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isAnyEqualCuda(const uint8_t *image, const uint8_t *value, size_t valueCount, uint32_t width, uint32_t height, uint32_t *differenceCount)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Launch bounds check
    if (x < width && y < height) {
        const uint32_t id = y * width + x;

        uint8_t pixelValue = image[id];
        bool equal = false;

        // Use shared memory to minimize global memory access
        extern __shared__ uint8_t sharedValue[];
        uint32_t tid = threadIdx.y * blockDim.x + threadIdx.x;
        for (uint32_t i = tid; i < valueCount; i += blockDim.x * blockDim.y) {
            sharedValue[i] = value[i];
        }
        __syncthreads();
        
        // Unroll loop for better performance
        for (uint32_t i = 0; i < valueCount; ++i) {
            if (pixelValue == sharedValue[i]) {
                equal = true;
                break;
            }
        }

        // Atomic operation if condition is met
        if (equal) {
            atomicAdd(differenceCount, 1);
        }
    }
}
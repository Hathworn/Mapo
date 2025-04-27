#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isAnyEqualCuda(const uint8_t *image, uint8_t *value, size_t valueCount, uint32_t width, uint32_t height, uint32_t *differenceCount) 
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure only valid threads compute
    if (x < width && y < height) {
        // Calculate 1D index from 2D coordinates
        const uint32_t id = y * width + x;

        // Use shared memory for faster value access
        extern __shared__ uint8_t sharedValue[];
        if (threadIdx.x < valueCount) {
            sharedValue[threadIdx.x] = value[threadIdx.x];
        }
        __syncthreads();

        // Check for equality
        bool equal = false;
        for (uint32_t i = 0; i < valueCount; ++i) {
            if (image[id] == sharedValue[i]) {
                equal = true;
                break;
            }
        }

        // Use atomic operation for concurrent addition
        if (equal) 
            atomicAdd(differenceCount, 1);
    }
}
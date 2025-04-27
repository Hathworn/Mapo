#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void projectionProfileCuda(const uint8_t *image, uint32_t rowSize, bool horizontal, uint32_t width, uint32_t height, uint32_t *projection)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Changed if condition to guard thread execution using thread index check
    if (x < width && y < height) {
        uint32_t index = y * rowSize + x;
        atomicAdd(&projection[image[index]], 1); // Use atomic operations for synchronization
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void projectionProfileHorizontalCuda(const uint8_t * image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * projection)
{
    // Calculate global thread index
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y; 

    if (y < height) {
        // Each thread in this block processes multiple elements in a loop
        for (uint32_t x = blockIdx.x * blockDim.x + threadIdx.x; x < width; x += blockDim.x * gridDim.x) {
            const uint8_t * imageX = image + y * rowSize + x;
            atomicAdd(&projection[x], (*imageX));
        }
    }
}
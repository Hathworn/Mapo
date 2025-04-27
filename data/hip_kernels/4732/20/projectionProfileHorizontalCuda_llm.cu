#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void projectionProfileHorizontalCuda(const uint8_t * image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * projection)
{
    // Calculate unique thread index for x
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;

    // Use a single loop to iterate over y-coordinate
    if (x < width) {
        uint32_t sum = 0;
        for (uint32_t y = 0; y < height; ++y) {
            const uint8_t * imageX = image + y * rowSize + x;
            sum += *imageX;
        }
        atomicAdd(&projection[x], sum);
    }
}
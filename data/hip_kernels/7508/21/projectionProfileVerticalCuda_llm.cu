#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void projectionProfileVerticalCuda(const uint8_t *image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t *projection)
{
    // Use a single block dimension for x and loop over y for efficient access
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;

    if (x < width) {
        uint32_t sum = 0; // Use a register to store sum locally
        for (uint32_t y = 0; y < height; ++y) {
            const uint8_t *imageY = image + y * rowSize + x;
            sum += *imageY;
        }
        atomicAdd(&projection[blockIdx.x * blockDim.x + threadIdx.x], sum);
    }
}
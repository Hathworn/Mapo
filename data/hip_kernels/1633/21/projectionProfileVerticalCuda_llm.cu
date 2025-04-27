#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void projectionProfileVerticalCuda(const uint8_t *image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t *projection)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    // Use y as a thread-local accumulator to minimize atomic operations
    const uint32_t yStart = blockDim.y * blockIdx.y + threadIdx.y;
    const uint32_t stride = gridDim.y * blockDim.y; // Move down by entire grid height

    if (x < width) {
        uint32_t sum = 0;
        for (uint32_t y = yStart; y < height; y += stride) {
            const uint8_t *imageY = image + y * rowSize + x;
            sum += *imageY;
        }
        // Sum computed, perform atomic add once per thread for this x coordinate
        atomicAdd(&projection[yStart], sum);
    }
}
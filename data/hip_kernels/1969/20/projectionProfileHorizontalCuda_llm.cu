```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void projectionProfileHorizontalCuda(const uint8_t * image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * projection)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockIdx.y;  // Optimize: Use only y-dimension for block index

    // Iterate over all elements in the column, handling multiple rows per thread
    if (x < width) {
        uint32_t sum = 0;
        for (uint32_t i = y * blockDim.y + threadIdx.y; i < height; i += blockDim.y * gridDim.y) {
            const uint8_t * imageX = image + i * rowSize + x;
            sum += *imageX;
        }

        // Optimize: Use atomicAdd after processing all rows to reduce contention
        atomicAdd(&projection[x], sum);
    }
}
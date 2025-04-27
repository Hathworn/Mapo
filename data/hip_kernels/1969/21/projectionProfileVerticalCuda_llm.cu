#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void projectionProfileVerticalCuda(const uint8_t * image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * projection) 
{
    // Calculate the x-coordinate for threads, y is block index
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Iterate over rows for the current x coordinate
    if (x < width) {
        for (uint32_t y = blockIdx.y * blockDim.y + threadIdx.y; y < height; y += blockDim.y * gridDim.y) {
            const uint8_t * imageY = image + y * rowSize + x;
            atomicAdd(&projection[y], *imageY); // Atomic add to avoid race condition
        }
    }
}
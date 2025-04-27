#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogramCuda(const uint8_t *data, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t *histogram)
{
    // Calculate the unique thread index
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Check if the thread is within image bounds
    if (x < width && y < height) {
        // Calculate linear index in the data array
        const uint32_t id = y * rowSize + x;

        // Use atomicAdd for safe concurrent updates to the histogram array
        atomicAdd(&histogram[data[id]], 1);
    }
}
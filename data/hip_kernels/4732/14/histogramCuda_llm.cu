#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogramCuda(const uint8_t * data, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * histogram)
{
    // Calculate global thread index for 1D data
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure within bounds before processing
    if (x < width && y < height) {
        const uint32_t id = y * rowSize + x;
        // Use atomic operations for safely updating histogram in parallel
        atomicAdd(&histogram[data[id]], 1);
    }
}
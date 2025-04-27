#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogramCuda(const uint8_t *data, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t *histogram) {
    // Calculate unique thread index within the image area
    const uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the thread is within image bounds
    if (x < width && y < height) {
        // Compute linear index to access the data
        const uint32_t id = y * rowSize + x;

        // Use atomic operation to safely update the histogram
        atomicAdd(&histogram[data[id]], 1);
    }
}
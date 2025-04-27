#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogramCuda(const uint8_t *data, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t *histogram)
{
    // Calculate global thread id for the flattened 2D grid
    const uint32_t id = blockIdx.y * blockDim.y * rowSize + blockIdx.x * blockDim.x + threadIdx.y * rowSize + threadIdx.x;
    
    // Ensure the calculated id is within bounds
    if (id < height * rowSize) {
        atomicAdd(&histogram[data[id]], 1);
    }
}
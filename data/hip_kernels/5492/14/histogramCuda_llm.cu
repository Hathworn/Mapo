#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogramCuda(const uint8_t *data, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t *histogram)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Use shared memory for histogram to reduce global memory accesses
    __shared__ uint32_t localHistogram[256];
    
    // Initialize shared histogram
    if (threadIdx.x < 256)
        localHistogram[threadIdx.x] = 0;
    __syncthreads();

    if (x < width && y < height)
    {
        const uint32_t id = y * rowSize + x;
        atomicAdd(&localHistogram[data[id]], 1);
    }
    __syncthreads();

    // Reduce results to global histogram
    if (threadIdx.x < 256)
        atomicAdd(&histogram[threadIdx.x], localHistogram[threadIdx.x]);
}
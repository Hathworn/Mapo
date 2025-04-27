```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogramCuda( const uint8_t * data, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * histogram )
{
    __shared__ uint32_t sharedHist[256]; // Declare shared memory for histogram bins
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if (threadIdx.x < 256) { // Initialize shared histogram bins to 0
        sharedHist[threadIdx.x] = 0;
    }
    __syncthreads();

    if ( x < width && y < height ) {
        const uint32_t id = y * rowSize + x;
        atomicAdd(&sharedHist[data[id]], 1); // Update shared histogram
    }
    __syncthreads();

    if (threadIdx.x < 256) {
        atomicAdd(&histogram[threadIdx.x], sharedHist[threadIdx.x]); // Update global histogram
    }
}
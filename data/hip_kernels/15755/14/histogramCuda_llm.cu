#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogramCuda( const uint8_t * data, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * histogram )
{
    // Use shared memory to minimize global memory access
    __shared__ uint32_t localHist[256];
    if (threadIdx.x < 256) {
        localHist[threadIdx.x] = 0;
    }
    __syncthreads();

    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if ( x < width && y < height ) {
        const uint32_t id = y * rowSize + x;
        atomicAdd( &localHist[data[id]], 1 );
    }
    __syncthreads();

    if (threadIdx.x < 256) {
        atomicAdd(&(histogram[threadIdx.x]), localHist[threadIdx.x]);
    }
}
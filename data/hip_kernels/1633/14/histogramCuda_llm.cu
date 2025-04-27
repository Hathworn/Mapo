#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogramCuda( const uint8_t * data, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * histogram )
{
    // Calculate global thread index
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Check for boundaries
    if ( x < width && y < height ) {
        // Calculate linear index
        const uint32_t id = y * rowSize + x;

        // Use shared memory for intermediate histogram results (assuming 256 bins)
        extern __shared__ uint32_t sharedHist[];
        uint32_t bin = data[id];
        atomicAdd(&sharedHist[bin], 1);

        // Ensure all threads have updated shared memory
        __syncthreads();

        // Use first thread in each block to update the global histogram
        if (threadIdx.x == 0 && threadIdx.y == 0) {
            for (int i = 0; i < 256; ++i) {
                atomicAdd(&histogram[i], sharedHist[i]);
            }
        }
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void invertCuda( const uint8_t * __restrict__ in, uint32_t rowSizeIn, uint8_t * __restrict__ out, uint32_t rowSizeOut, uint32_t width, uint32_t height )
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if ( x < width && y < height ) {
        // Use shared memory for efficient memory access
        __shared__ uint8_t tile[32][32];

        // Load input data into shared memory
        uint32_t linearIndex = y * rowSizeIn + x;
        tile[threadIdx.y][threadIdx.x] = in[linearIndex];

        __syncthreads(); // Ensure all threads have loaded data

        // Write inverted data to output
        if (x < width && y < height) {
            out[y * rowSizeOut + x] = ~tile[threadIdx.y][threadIdx.x];
        }
    }
}
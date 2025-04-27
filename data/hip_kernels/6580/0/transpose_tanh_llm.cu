#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_DIM 16

__global__ void transpose_tanh(float *odata, float *idata, int width, int height)
{
    __shared__ float block[BLOCK_DIM][BLOCK_DIM+1];

    // Calculate global indices
    unsigned int xIndex = blockIdx.x * BLOCK_DIM + threadIdx.x;
    unsigned int yIndex = blockIdx.y * BLOCK_DIM + threadIdx.y;

    // Load from idata to shared memory ensuring boundary conditions
    if (xIndex < width && yIndex < height)
    {
        unsigned int index_in = yIndex * width + xIndex;
        block[threadIdx.y][threadIdx.x] = idata[index_in];
    }

    __syncthreads(); // Ensure all threads have written to shared memory

    // Calculate transposed global indices
    xIndex = blockIdx.y * BLOCK_DIM + threadIdx.x;
    yIndex = blockIdx.x * BLOCK_DIM + threadIdx.y;

    // Store from shared memory to odata with boundary check
    if (xIndex < height && yIndex < width)
    {
        unsigned int index_out = yIndex * height + xIndex;
        odata[index_out] = block[threadIdx.x][threadIdx.y];
    }
}
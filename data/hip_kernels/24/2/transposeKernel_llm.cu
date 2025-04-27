#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeKernel(float *inData, float *outData)
{
    __shared__ float tile[TILE_DIM][TILE_DIM + 1]; // Prevent bank conflicts

    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int width = gridDim.x * TILE_DIM;

    // Load data into shared memory - coalesced access
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
    {
        if (y + j < width && x < width) // Boundary check
            tile[threadIdx.y + j][threadIdx.x] = inData[(y + j) * width + x];
    }

    __syncthreads();

    // Recalculate x, y for transposition
    x = blockIdx.y * TILE_DIM + threadIdx.x;
    y = blockIdx.x * TILE_DIM + threadIdx.y;

    // Store to output array - coalesced access
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
    {
        if (y + j < width && x < width) // Boundary check
            outData[(y + j) * width + x] = tile[threadIdx.x][threadIdx.y + j];
    }
}
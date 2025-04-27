#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copySharedMem(float *odata, const float *idata)
{
    __shared__ float tile[TILE_DIM][TILE_DIM]; // Change to 2D array for better indexing

    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int width = gridDim.x * TILE_DIM;

    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
        tile[threadIdx.y + j][threadIdx.x] = idata[(y + j) * width + x]; // Use 2D indexing

    __syncthreads();

    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
        odata[(y + j) * width + x] = tile[threadIdx.y + j][threadIdx.x]; // Use 2D indexing
}
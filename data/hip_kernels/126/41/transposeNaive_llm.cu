#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaive(float *odata, const float *idata)
{
    // Calculate x and y indices
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int width = gridDim.x * TILE_DIM;

    // Use shared memory to optimize global memory access
    __shared__ float tile[TILE_DIM][TILE_DIM+1];

    // Load data into shared memory
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS) {
        tile[threadIdx.y + j][threadIdx.x] = idata[(y + j) * width + x];
    }

    __syncthreads();

    // Transpose the tile
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS) {
        odata[(x * width) + (y + j)] = tile[threadIdx.x][threadIdx.y + j];
    }
}
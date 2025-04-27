#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeNaive(float *odata, const float *idata)
{
    // Use shared memory to optimize data access
    __shared__ float tile[TILE_DIM][TILE_DIM];

    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int width = gridDim.x * TILE_DIM;

    // Load data into shared memory
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS) {
        tile[threadIdx.y + j][threadIdx.x] = idata[(y + j) * width + x];
    }
    __syncthreads();

    // Write data from shared memory to output
    x = blockIdx.y * TILE_DIM + threadIdx.x;
    y = blockIdx.x * TILE_DIM + threadIdx.y;

    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS) {
        odata[(y + j) * width + x] = tile[threadIdx.x][threadIdx.y + j];
    }
}
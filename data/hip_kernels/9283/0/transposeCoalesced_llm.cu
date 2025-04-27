#include "hip/hip_runtime.h"
#include "includes.h"

/* Prototype matrix representation. */
struct dag_array_t{
    size_t rows;
    size_t cols;
    int* matrix;
};

/* Constants for shared memory tiling. */
const int tp_TILE_DIM = 32;
const int tp_BLOCK_ROWS = 8;

__global__ void transposeCoalesced(int *result, const int *in)
{
    const int TILE_DIM = tp_TILE_DIM;
    const int BLOCK_ROWS = tp_BLOCK_ROWS;

    __shared__ int tile[TILE_DIM][TILE_DIM + 1];  // +1 to avoid bank conflicts

    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int width = gridDim.x * TILE_DIM;

    // Load data into shared memory
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
        tile[threadIdx.y + j][threadIdx.x] = in[(y + j) * width + x];

    __syncthreads();

    // Calculate transposed coordinates
    x = blockIdx.y * TILE_DIM + threadIdx.x;
    y = blockIdx.x * TILE_DIM + threadIdx.y;

    // Write transposed data
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
        result[(y + j) * width + x] = tile[threadIdx.x][threadIdx.y + j];
}
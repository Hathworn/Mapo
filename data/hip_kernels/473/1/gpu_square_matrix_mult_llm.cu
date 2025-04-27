#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16

__global__ void gpu_square_matrix_mult(int *d_a, int *d_b, int *d_result, int n)
{
    __shared__ int tile_a[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ int tile_b[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.y * BLOCK_SIZE + threadIdx.y;
    int col = blockIdx.x * BLOCK_SIZE + threadIdx.x;
    int tmp = 0;

    for (int sub = 0; sub < gridDim.x; ++sub)
    {
        int tile_a_idx = row * n + sub * BLOCK_SIZE + threadIdx.x;
        int tile_b_idx = (sub * BLOCK_SIZE + threadIdx.y) * n + col;

        // Load tiles into shared memory, zero-pad if out-of-bounds
        tile_a[threadIdx.y][threadIdx.x] = (tile_a_idx < n * n) ? d_a[tile_a_idx] : 0;
        tile_b[threadIdx.y][threadIdx.x] = (tile_b_idx < n * n) ? d_b[tile_b_idx] : 0;
        __syncthreads();

        // Matrix multiplication within block
        for (int k = 0; k < BLOCK_SIZE; ++k)
        {
            tmp += tile_a[threadIdx.y][k] * tile_b[k][threadIdx.x];
        }
        __syncthreads();
    }

    if (row < n && col < n)
    {
        d_result[row * n + col] = tmp;
    }
}
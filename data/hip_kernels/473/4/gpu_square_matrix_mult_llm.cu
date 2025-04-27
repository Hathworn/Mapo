#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_square_matrix_mult(int *d_a, int *d_b, int *d_result, int n)
{
    __shared__ int tile_a[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ int tile_b[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.y * BLOCK_SIZE + threadIdx.y;
    int col = blockIdx.x * BLOCK_SIZE + threadIdx.x;
    int tmp = 0;

    // Iterate over all sub-matrices ('tiles')
    for (int sub = 0; sub < gridDim.x; ++sub)
    {
        // Load data from global memory to shared memory with boundary checks
        int idx_a = row * n + sub * BLOCK_SIZE + threadIdx.x;
        tile_a[threadIdx.y][threadIdx.x] = (idx_a < n * n) ? d_a[idx_a] : 0;

        int idx_b = (sub * BLOCK_SIZE + threadIdx.y) * n + col;
        tile_b[threadIdx.y][threadIdx.x] = (idx_b < n * n) ? d_b[idx_b] : 0;

        // Synchronize to ensure all data is loaded
        __syncthreads();

        // Perform multiplication on the loaded tiles
        for (int k = 0; k < BLOCK_SIZE; ++k)
        {
            tmp += tile_a[threadIdx.y][k] * tile_b[k][threadIdx.x];
        }

        // Synchronize before loading new subtile
        __syncthreads();
    }

    // Write result to global memory
    if(row < n && col < n)
    {
        d_result[row * n + col] = tmp;
    }
}
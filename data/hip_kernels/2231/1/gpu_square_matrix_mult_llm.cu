#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_square_matrix_mult(int *d_a, int *d_b, int *d_result, int n)
{
    __shared__ int tile_a[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ int tile_b[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.y * BLOCK_SIZE + threadIdx.y;
    int col = blockIdx.x * BLOCK_SIZE + threadIdx.x;
    int tmp = 0;

    for (int sub = 0; sub < (n + BLOCK_SIZE - 1) / BLOCK_SIZE; ++sub) // Ensure full grid coverage
    {
        int idx_a = row * n + sub * BLOCK_SIZE + threadIdx.x;
        int idx_b = (sub * BLOCK_SIZE + threadIdx.y) * n + col;

        // Use ternary operator for concise bounds check and assignment
        tile_a[threadIdx.y][threadIdx.x] = (idx_a < n * n) ? d_a[idx_a] : 0;
        tile_b[threadIdx.y][threadIdx.x] = (idx_b < n * n) ? d_b[idx_b] : 0;

        __syncthreads(); // Sync to ensure tiles are fully loaded

        for (int k = 0; k < BLOCK_SIZE; ++k)
        {
            tmp += tile_a[threadIdx.y][k] * tile_b[k][threadIdx.x];
        }

        __syncthreads();
    }

    // Store the result if within bounds
    if (row < n && col < n)
    {
        d_result[row * n + col] = tmp;
    }
}
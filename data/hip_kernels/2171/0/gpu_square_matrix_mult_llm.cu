#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_square_matrix_mult(float *d_a, float *d_b, float *d_result, int n)
{
    __shared__ int tile_a[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ int tile_b[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.y * BLOCK_SIZE + threadIdx.y;
    int col = blockIdx.x * BLOCK_SIZE + threadIdx.x;
    int tmp = 0;

    // Loop over submatrices of d_a and d_b
    for (int sub = 0; sub < gridDim.x; ++sub)
    {
        // Load tile_a from d_a
        int a_idx = row * n + sub * BLOCK_SIZE + threadIdx.x;
        tile_a[threadIdx.y][threadIdx.x] = (a_idx < n * n) ? d_a[a_idx] : 0;

        // Load tile_b from d_b
        int b_idx = (sub * BLOCK_SIZE + threadIdx.y) * n + col;
        tile_b[threadIdx.y][threadIdx.x] = (b_idx < n * n) ? d_b[b_idx] : 0;

        __syncthreads(); // Wait for all threads to complete loading

        // Compute partial product for tile
        for (int k = 0; k < BLOCK_SIZE; ++k)
        {
            tmp += tile_a[threadIdx.y][k] * tile_b[k][threadIdx.x]; // Matrix multiplication
        }
        __syncthreads(); // Ensure all threads complete computation
    }

    // Write final result to global memory
    if (row < n && col < n)
    {
        d_result[row * n + col] = tmp;
    }
}
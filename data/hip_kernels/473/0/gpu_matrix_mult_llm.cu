#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16

__global__ void gpu_matrix_mult(int *a, int *b, int *c, int m, int n, int k)
{
    // Calculate global thread row and column indices
    int row = blockIdx.y * blockDim.y + threadIdx.y; 
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize shared memory for tiles of matrices a and b
    __shared__ int tile_a[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ int tile_b[BLOCK_SIZE][BLOCK_SIZE];

    int sum = 0; 

    // Loop through tiles of matrix
    for (int tileIdx = 0; tileIdx < (n + BLOCK_SIZE - 1) / BLOCK_SIZE; ++tileIdx) {
        
        // Load data into shared memory tiles
        if (row < m && tileIdx * BLOCK_SIZE + threadIdx.x < n)
            tile_a[threadIdx.y][threadIdx.x] = a[row * n + tileIdx * BLOCK_SIZE + threadIdx.x];
        else
            tile_a[threadIdx.y][threadIdx.x] = 0;

        if (col < k && tileIdx * BLOCK_SIZE + threadIdx.y < n)
            tile_b[threadIdx.y][threadIdx.x] = b[(tileIdx * BLOCK_SIZE + threadIdx.y) * k + col];
        else
            tile_b[threadIdx.y][threadIdx.x] = 0;

        __syncthreads();  // Synchronize threads to ensure complete loading

        // Compute partial results
        for (int j = 0; j < BLOCK_SIZE; ++j) {
            sum += tile_a[threadIdx.y][j] * tile_b[j][threadIdx.x];
        }
        
        __syncthreads();  // Synchronize before loading new tile
    }

    // Write back result to matrix c
    if (row < m && col < k) {
        c[row * k + col] = sum;
    }
}
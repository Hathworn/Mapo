#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16

__global__ void gpu_square_matrix_mult(int *d_a, int *d_b, int *d_result, int n) {
    __shared__ int tile_a[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ int tile_b[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.y * BLOCK_SIZE + threadIdx.y;
    int col = blockIdx.x * BLOCK_SIZE + threadIdx.x;
    int tmp = 0;

    for (int sub = 0; sub < gridDim.x; ++sub) {
        // Load tiles into shared memory with bounds check
        if (row < n && (sub * BLOCK_SIZE + threadIdx.x) < n) {
            tile_a[threadIdx.y][threadIdx.x] = d_a[row * n + sub * BLOCK_SIZE + threadIdx.x];
        } else {
            tile_a[threadIdx.y][threadIdx.x] = 0;
        }

        if (col < n && (sub * BLOCK_SIZE + threadIdx.y) < n) {
            tile_b[threadIdx.y][threadIdx.x] = d_b[(sub * BLOCK_SIZE + threadIdx.y) * n + col];
        } else {
            tile_b[threadIdx.y][threadIdx.x] = 0;
        }

        __syncthreads();

        // Compute partial results
        for (int k = 0; k < BLOCK_SIZE; ++k) {
            tmp += tile_a[threadIdx.y][k] * tile_b[k][threadIdx.x];
        }
        
        __syncthreads();
    }

    // Write result to global memory
    if (row < n && col < n) {
        d_result[row * n + col] = tmp;
    }
}
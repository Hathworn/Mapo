#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixMulGPU(int *a, int *b, int *c, int N)
{
    // Allocate shared memory for sub-matrices of size blockDim.x x blockDim.y
    __shared__ int shared_a[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ int shared_b[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;
    int val = 0;

    // Loop over the sub-matrices of A and B required to compute the block sub-matrix
    for (int tileIdx = 0; tileIdx < (N + BLOCK_SIZE - 1) / BLOCK_SIZE; ++tileIdx) {
        // Load elements into shared memory
        if (row < N && (tileIdx * BLOCK_SIZE + threadIdx.y) < N)
            shared_a[threadIdx.x][threadIdx.y] = a[row * N + tileIdx * BLOCK_SIZE + threadIdx.y];
        else
            shared_a[threadIdx.x][threadIdx.y] = 0;

        if ((tileIdx * BLOCK_SIZE + threadIdx.x) < N && col < N)
            shared_b[threadIdx.x][threadIdx.y] = b[(tileIdx * BLOCK_SIZE + threadIdx.x) * N + col];
        else
            shared_b[threadIdx.x][threadIdx.y] = 0;

        __syncthreads();  // Synchronize to ensure all elements are loaded

        // Multiply the two matrices together
        for (int k = 0; k < BLOCK_SIZE; ++k) {
            val += shared_a[threadIdx.x][k] * shared_b[k][threadIdx.y];
        }
        __syncthreads();  // Synchronize to ensure computation is done before proceeding
    }

    // Write the block sub-matrix to global memory
    if (row < N && col < N) {
        c[row * N + col] = val;
    }
}
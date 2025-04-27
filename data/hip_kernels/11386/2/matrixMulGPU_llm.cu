#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixMulGPU(int *a, int *b, int *c) 
{
    // Use shared memory for more efficient access
    __shared__ int sharedA[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ int sharedB[BLOCK_SIZE][BLOCK_SIZE];
    
    int val = 0;
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    for (int m = 0; m < (N + BLOCK_SIZE - 1) / BLOCK_SIZE; ++m) 
    {
        // Load data into shared memory
        if (row < N && m * BLOCK_SIZE + threadIdx.y < N)
            sharedA[threadIdx.x][threadIdx.y] = a[row * N + m * BLOCK_SIZE + threadIdx.y];
        else
            sharedA[threadIdx.x][threadIdx.y] = 0;

        if (col < N && m * BLOCK_SIZE + threadIdx.x < N)
            sharedB[threadIdx.x][threadIdx.y] = b[(m * BLOCK_SIZE + threadIdx.x) * N + col];
        else
            sharedB[threadIdx.x][threadIdx.y] = 0;
        
        __syncthreads();

        // Compute the partial results
        for (int k = 0; k < BLOCK_SIZE; ++k)
            val += sharedA[threadIdx.x][k] * sharedB[k][threadIdx.y];
        
        __syncthreads();
    }

    // Write the result to the matrix
    if (row < N && col < N) 
        c[row * N + col] = val;
}
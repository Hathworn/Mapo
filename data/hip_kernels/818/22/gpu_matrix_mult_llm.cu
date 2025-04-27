```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_matrix_mult(int *a, int *b, int *c, int m, int n, int k)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y; // Get the row index
    int col = blockIdx.x * blockDim.x + threadIdx.x; // Get the column index
    int sum = 0; // Initialize the sum

    if (col < k && row < m) // Check boundary conditions
    {
        // Use shared memory for better data reuse
        __shared__ int shared_a[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ int shared_b[BLOCK_SIZE][BLOCK_SIZE];
        
        for (int tileIdx = 0; tileIdx < (n + BLOCK_SIZE - 1) / BLOCK_SIZE; ++tileIdx)
        {
            if (tileIdx * BLOCK_SIZE + threadIdx.x < n && row < m)
                shared_a[threadIdx.y][threadIdx.x] = a[row * n + tileIdx * BLOCK_SIZE + threadIdx.x];
            else
                shared_a[threadIdx.y][threadIdx.x] = 0;

            if (tileIdx * BLOCK_SIZE + threadIdx.y < n && col < k)
                shared_b[threadIdx.y][threadIdx.x] = b[(tileIdx * BLOCK_SIZE + threadIdx.y) * k + col];
            else
                shared_b[threadIdx.y][threadIdx.x] = 0;

            __syncthreads();

            for (int i = 0; i < BLOCK_SIZE; ++i)
                sum += shared_a[threadIdx.y][i] * shared_b[i][threadIdx.x];

            __syncthreads();
        }
        c[row * k + col] = sum; // Write the result to matrix c
    }
}
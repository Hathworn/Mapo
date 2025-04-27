#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_matrix_mult_one(int *a, int *b, int *c, int m, int n, int k)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y; // get the row
    int col = blockIdx.x * blockDim.x + threadIdx.x; // get the column
    int sum = 0; // initialize the sum

    // Load each row and column element into shared memory for reuse
    __shared__ int shared_a[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ int shared_b[BLOCK_SIZE][BLOCK_SIZE];

    if (col < k && row < m) // check to make sure that the thread needs to compute
    {
        for (int tile = 0; tile < (n + BLOCK_SIZE - 1) / BLOCK_SIZE; ++tile) 
        {
            // Each thread loads one element from matrices
            if (tile * BLOCK_SIZE + threadIdx.x < n && row < m)
                shared_a[threadIdx.y][threadIdx.x] = a[row * n + tile * BLOCK_SIZE + threadIdx.x];
            else
                shared_a[threadIdx.y][threadIdx.x] = 0;

            if (tile * BLOCK_SIZE + threadIdx.y < n && col < k)
                shared_b[threadIdx.y][threadIdx.x] = b[(tile * BLOCK_SIZE + threadIdx.y) * k + col];
            else
                shared_b[threadIdx.y][threadIdx.x] = 0;

            __syncthreads(); // Synchronize to make sure submatrices are loaded

            // Multiply the two matrices
            for (int i = 0; i < BLOCK_SIZE; ++i)
                sum += shared_a[threadIdx.y][i] * shared_b[i][threadIdx.x];

            __syncthreads(); // Synchronize to make sure computation is done before loading new submatrices
        }
        c[row * k + col] = sum; // Write the block submatrix to global memory
    }
}
```
Note: The above optimization assumes the definition of `BLOCK_SIZE` somewhere else in the code, which matches the CUDA block size used. Adjust `BLOCK_SIZE` accordingly to best fit your hardware characteristics.
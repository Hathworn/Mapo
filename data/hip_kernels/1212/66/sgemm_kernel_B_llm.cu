#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for SGEMM using shared memory
__global__ void sgemm_kernel_B(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Determine current column and row based on thread and block index
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Allocate shared memory for A and B sub-matrices
    __shared__ float shared_A[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float shared_B[BLOCK_SIZE][BLOCK_SIZE];

    // Initialize sum for the dot product
    float sum = 0.f;

    // Perform block-wise matrix multiplication
    for (int block = 0; block < (K + BLOCK_SIZE - 1) / BLOCK_SIZE; ++block) {
        // Load A and B data into shared memory
        if (block * BLOCK_SIZE + threadIdx.x < K && row < N)
            shared_A[threadIdx.y][threadIdx.x] = A[row * K + block * BLOCK_SIZE + threadIdx.x];
        else
            shared_A[threadIdx.y][threadIdx.x] = 0.0f;

        if (block * BLOCK_SIZE + threadIdx.y < K && col < M)
            shared_B[threadIdx.y][threadIdx.x] = B[(block * BLOCK_SIZE + threadIdx.y) * M + col];
        else
            shared_B[threadIdx.y][threadIdx.x] = 0.0f;

        // Synchronize to ensure all threads have loaded their data
        __syncthreads();

        // Perform partial dot product using loaded data
        for (int i = 0; i < BLOCK_SIZE; ++i)
            sum += shared_A[threadIdx.y][i] * shared_B[i][threadIdx.x];

        // Synchronize to ensure all threads have completed their block computations
        __syncthreads();
    }

    // Write result to C matrix with appropriate scaling
    if (row < N && col < M)
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
}
```

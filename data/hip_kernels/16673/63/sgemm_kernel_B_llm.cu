#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel_B(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Use shared memory for faster access
    __shared__ float shared_A[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float shared_B[BLOCK_SIZE][BLOCK_SIZE];

    float sum = 0.f;

    // Loop over tiles
    for (int tileIdx = 0; tileIdx < (K + BLOCK_SIZE - 1) / BLOCK_SIZE; ++tileIdx)
    {
        // Load data into shared memory
        if (row < N && tileIdx * BLOCK_SIZE + threadIdx.x < K)
            shared_A[threadIdx.y][threadIdx.x] = A[row * K + tileIdx * BLOCK_SIZE + threadIdx.x];
        else
            shared_A[threadIdx.y][threadIdx.x] = 0.0f;

        if (col < M && tileIdx * BLOCK_SIZE + threadIdx.y < K)
            shared_B[threadIdx.y][threadIdx.x] = B[(tileIdx * BLOCK_SIZE + threadIdx.y) * M + col];
        else
            shared_B[threadIdx.y][threadIdx.x] = 0.0f;

        __syncthreads();

        // Perform partial matrix multiplication
        for (int i = 0; i < BLOCK_SIZE; ++i)
            sum += shared_A[threadIdx.y][i] * shared_B[i][threadIdx.x];

        __syncthreads();
    }

    // Write final result into global memory
    if (row < N && col < M)
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
}
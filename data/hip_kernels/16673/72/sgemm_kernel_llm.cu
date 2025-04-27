#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Calculate global thread row and column 
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Use shared memory to improve memory access pattern
    __shared__ float tileA[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float tileB[BLOCK_SIZE][BLOCK_SIZE];

    float sum = 0.f;
    // Loop over tiles of input matrices
    for (int t = 0; t < (K + BLOCK_SIZE - 1) / BLOCK_SIZE; ++t) {
        if (row < N && t * BLOCK_SIZE + threadIdx.x < K)
            tileA[threadIdx.y][threadIdx.x] = A[row * K + t * BLOCK_SIZE + threadIdx.x];
        else
            tileA[threadIdx.y][threadIdx.x] = 0;

        if (col < M && t * BLOCK_SIZE + threadIdx.y < K)
            tileB[threadIdx.y][threadIdx.x] = B[(t * BLOCK_SIZE + threadIdx.y) * M + col];
        else
            tileB[threadIdx.y][threadIdx.x] = 0;

        __syncthreads();

        for (int i = 0; i < BLOCK_SIZE; ++i)
            sum += tileA[threadIdx.y][i] * tileB[i][threadIdx.x];

        __syncthreads();
    }

    if (row < N && col < M)
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
}
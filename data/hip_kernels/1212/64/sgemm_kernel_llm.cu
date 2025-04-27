#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 16

__global__ void sgemm_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Shared memory for sub-matrices
    __shared__ float sA[TILE_SIZE][TILE_SIZE];
    __shared__ float sB[TILE_SIZE][TILE_SIZE];

    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    float sum = 0.f;

    // Loop over tiles
    for (int t = 0; t < (K - 1) / TILE_SIZE + 1; ++t) {
        // Load tiles into shared memory
        if (row < N && t * TILE_SIZE + threadIdx.x < K)
            sA[threadIdx.y][threadIdx.x] = A[row * K + t * TILE_SIZE + threadIdx.x];
        else
            sA[threadIdx.y][threadIdx.x] = 0.0f;

        if (col < M && t * TILE_SIZE + threadIdx.y < K)
            sB[threadIdx.y][threadIdx.x] = B[(t * TILE_SIZE + threadIdx.y) * M + col];
        else
            sB[threadIdx.y][threadIdx.x] = 0.0f;

        __syncthreads();

        // Accumulate partial results
        for (int i = 0; i < TILE_SIZE; ++i)
            sum += sA[threadIdx.y][i] * sB[i][threadIdx.x];

        __syncthreads();
    }

    // Write result to global memory
    if (row < N && col < M)
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
}
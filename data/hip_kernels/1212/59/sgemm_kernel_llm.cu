#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta) 
{
    // Use shared memory for tiling
    __shared__ float Asub[32][32]; 
    __shared__ float Bsub[32][32];

    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    float sum = 0.0f;

    for (int tileIdx = 0; tileIdx < (K + 31) / 32; ++tileIdx) {
        // Load tiles into shared memory
        if (row < N && tileIdx * 32 + threadIdx.x < K)
            Asub[threadIdx.y][threadIdx.x] = A[row * K + tileIdx * 32 + threadIdx.x];
        else
            Asub[threadIdx.y][threadIdx.x] = 0.0f;
        
        if (col < M && tileIdx * 32 + threadIdx.y < K)
            Bsub[threadIdx.y][threadIdx.x] = B[(tileIdx * 32 + threadIdx.y) * M + col];
        else
            Bsub[threadIdx.y][threadIdx.x] = 0.0f;

        __syncthreads(); // Synchronize to ensure all tiles are loaded

        for (int i = 0; i < 32; ++i)
            sum += Asub[threadIdx.y][i] * Bsub[i][threadIdx.x];

        __syncthreads(); // Synchronize before loading the next tile
    }

    if (row < N && col < M)
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
}
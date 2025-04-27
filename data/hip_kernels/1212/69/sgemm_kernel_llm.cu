#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void sgemm_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Use shared memory to reduce global memory access
    __shared__ float shared_A[32][32];
    __shared__ float shared_B[32][32];

    // Calculate row and col indices
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    float sum = 0.f;
    
    // Load data into shared memory in tiles
    for (int tileIdx = 0; tileIdx < (K + 31) / 32; ++tileIdx)
    {
        if (tileIdx * 32 + threadIdx.x < K && row < N)
            shared_A[threadIdx.y][threadIdx.x] = A[row * K + tileIdx * 32 + threadIdx.x];
        else
            shared_A[threadIdx.y][threadIdx.x] = 0.0;

        if (tileIdx * 32 + threadIdx.y < K && col < M)
            shared_B[threadIdx.y][threadIdx.x] = B[(tileIdx * 32 + threadIdx.y) * M + col];
        else
            shared_B[threadIdx.y][threadIdx.x] = 0.0;

        // Wait for all threads to load data into shared memory
        __syncthreads();

        // Perform multiplication for this tile
        for (int k = 0; k < 32; ++k)
            sum += shared_A[threadIdx.y][k] * shared_B[k][threadIdx.x];

        // Wait before loading next tile
        __syncthreads();
    }

    // Compute final result
    if (row < N && col < M)
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
}
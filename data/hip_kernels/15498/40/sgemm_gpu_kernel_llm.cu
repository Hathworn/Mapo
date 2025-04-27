#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sgemm_gpu_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Calculate column and row indices for threads
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure that the thread is within matrix bounds
    if (row < N && col < M) {
        float sum = 0.f;

        // Use shared memory for partial matrix tiles to optimize memory access
        __shared__ float sharedA[TILE_DIM][TILE_DIM];
        __shared__ float sharedB[TILE_DIM][TILE_DIM];

        // Iterate over tiles
        for (int t = 0; t < (K + TILE_DIM - 1) / TILE_DIM; ++t) {
            // Load data into shared memory
            if (t * TILE_DIM + threadIdx.x < K && row < N)
                sharedA[threadIdx.y][threadIdx.x] = A[row * K + t * TILE_DIM + threadIdx.x];
            else
                sharedA[threadIdx.y][threadIdx.x] = 0.0f;

            if (t * TILE_DIM + threadIdx.y < K && col < M)
                sharedB[threadIdx.y][threadIdx.x] = B[(t * TILE_DIM + threadIdx.y) * M + col];
            else
                sharedB[threadIdx.y][threadIdx.x] = 0.0f;

            // Synchronize threads to ensure full tile is loaded
            __syncthreads();

            // Compute partial product for the tile
            for (int i = 0; i < TILE_DIM; ++i)
                sum += sharedA[threadIdx.y][i] * sharedB[i][threadIdx.x];

            // Synchronize threads before loading new tile
            __syncthreads();
        }

        // Update output matrix
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
```

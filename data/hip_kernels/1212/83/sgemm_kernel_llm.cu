#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 16

__global__ void sgemm_kernel(const float *A, const float *B, float *C, int M, int N, int K, float alpha, float beta)
{
    int col = blockIdx.x * TILE_SIZE + threadIdx.x;
    int row = blockIdx.y * TILE_SIZE + threadIdx.y;

    // Ensure thread is within bounds
    if (col < N && row < M)
    {
        float element_c = 0.f;
        // Use shared memory for efficient cache use
        __shared__ float Asub[TILE_SIZE][TILE_SIZE];
        __shared__ float Bsub[TILE_SIZE][TILE_SIZE];

        for (int e = 0; e < K; e += TILE_SIZE)
        {
            // Load tiles into shared memory
            Asub[threadIdx.y][threadIdx.x] = A[row * K + e + threadIdx.x];
            Bsub[threadIdx.y][threadIdx.x] = B[(e + threadIdx.y) * N + col];

            __syncthreads();

            for (int i = 0; i < TILE_SIZE; i++)
            {
                element_c += Asub[threadIdx.y][i] * Bsub[i][threadIdx.x];
            }

            __syncthreads();
        }

        // Update output matrix
        C[row * N + col] = alpha * element_c + beta * C[row * N + col];
    }
}
```

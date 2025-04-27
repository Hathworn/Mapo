#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_gpu_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Calculate global row and column indices
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure valid row and column indices
    if (row < N && col < M) {
        float sum = 0.f;

        // Use shared memory for better performance
        extern __shared__ float shmem[];
        float* As = shmem;
        float* Bs = shmem + blockDim.y;

        for (int i = 0; i < K; ++i) {
            As[threadIdx.y] = A[row * K + i];
            Bs[threadIdx.x] = B[i * M + col];
            __syncthreads();

            sum += As[threadIdx.y] * Bs[threadIdx.x];
            __syncthreads();
        }

        // Compute final output with alpha and beta scaling
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
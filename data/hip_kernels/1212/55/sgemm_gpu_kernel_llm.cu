#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_gpu_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Calculate global thread indices in x and y direction
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure threads are within matrix boundaries
    if (row < N && col < M) {
        float sum = 0.0f;

        // Use register tiling for better memory access pattern
        for (int i = 0; i < K; ++i) {
            sum += A[row * K + i] * B[i * M + col];
        }

        // Compute final element of C with alpha and beta
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
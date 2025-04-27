#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel_B(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    if (row < N && col < M) {  // Ensure row and col are within bounds
        float sum = 0.f;
        for (int i = 0; i < K; ++i) {
            sum += A[row * K + i] * B[i * M + col];  // Corrected indexing for B
        }
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
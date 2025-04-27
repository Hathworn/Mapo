#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if row and col are within matrix bounds
    if (row < N && col < M) {
        float sum = 0.f;
        // Improve memory access by handling coalesced reads
        for (int i = 0; i < K; ++i) {
            sum += A[row * K + i] * B[i * M + col];
        }
        // Efficiently compute the output element
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
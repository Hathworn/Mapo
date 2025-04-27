#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel_A(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Compute global thread row and column indices
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to avoid illegal memory accesses
    if (row < N && col < M) {
        float sum = 0.f;
        // Unroll the loop for improved performance
        for (int i = 0; i < K; ++i) {
            sum += A[row * K + i] * B[i * K + col];
        }
        // Perform and store the result in C
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
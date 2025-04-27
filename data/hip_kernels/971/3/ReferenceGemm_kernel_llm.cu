#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReferenceGemm_kernel(int M, int N, int K, float alpha, float const *A, int lda, float const *B, int ldb, float beta, float *C, int ldc) {
    int row = blockIdx.y * blockDim.y + threadIdx.y; // Changed index variable names
    int col = blockIdx.x * blockDim.x + threadIdx.x; // Changed index variable names

    if (row < M && col < N) { // Updated with more intuitive variable names
        float accumulator = 0.0f;

        for (int k = 0; k < K; ++k) {
            accumulator += A[row + k * lda] * B[k + col * ldb]; // Optimized indexing order
        }

        C[row + col * ldc] = alpha * accumulator + beta * C[row + col * ldc];
    }
}
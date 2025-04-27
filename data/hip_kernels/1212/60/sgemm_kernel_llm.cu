#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Calculate the column and row index for the C matrix
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to avoid out-of-bounds access
    if (row < N && col < M) {
        float sum = 0.f;

        // Perform matrix multiplication
        for (int i = 0; i < K; ++i)
            sum += A[row * K + i] * B[i * M + col];

        // Write the result to C with factoring by alpha and beta
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
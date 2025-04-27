#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sgemm_kernel_A(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Calculate global thread row and column index
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to avoid accessing out-of-range elements
    if (row < N && col < M) {
        float sum = 0.0f;

        // Use a more cache-friendly loop order
        for (int i = 0; i < K; ++i) {
            sum += A[row * K + i] * B[i * M + col]; // fix indexing error
        }

        // Write the result to the output matrix with scaling factors
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
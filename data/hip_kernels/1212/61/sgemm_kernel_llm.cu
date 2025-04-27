#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Calculate global thread row and column indices
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure row is within bounds
    if (row < N && col < M) {
        float sum = 0.f;
        
        // Unrolling the loop for better performance
        #pragma unroll
        for (int i = 0; i < K; ++i) {
            sum += A[row * K + i] * B[i * M + col];  // Fixed the indexing for B
        }

        // Update the matrix C with the result
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
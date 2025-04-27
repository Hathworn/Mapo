#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Calculate global row and column indices
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within bounds
    if (row < N && col < M) {
        float sum = 0.f;
        
        // Loop unrolling for better performance
        for (int i = 0; i < K; i += 4) {
            sum += A[row * K + i] * B[i * M + col];
            if(i + 1 < K) sum += A[row * K + (i + 1)] * B[(i + 1) * M + col];
            if(i + 2 < K) sum += A[row * K + (i + 2)] * B[(i + 2) * M + col];
            if(i + 3 < K) sum += A[row * K + (i + 3)] * B[(i + 3) * M + col];
        }

        // Update the output matrix element
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_gpu_kernel(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within bounds
    if (col < M && row < N) {
        float sum = 0.f;
        // Loop unrolling for better performance, assuming K is a multiple of 4
        for (int i = 0; i < K; i += 4) {
            sum += A[row * K + i] * B[i * M + col];
            sum += A[row * K + i + 1] * B[(i + 1) * M + col];
            sum += A[row * K + i + 2] * B[(i + 2) * M + col];
            sum += A[row * K + i + 3] * B[(i + 3) * M + col];
        }
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel_B(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Calculate column and row indices in C
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Initialize accumulator
    float sum = 0.f;

    // Use shared memory for faster access
    __shared__ float sharedA[1024]; // Adjust size based on block size
    __shared__ float sharedB[1024]; // Adjust size based on block size

    for (int i = 0; i < K; i += blockDim.x) {
        // Load data into shared memory
        if (row < N && (i + threadIdx.x) < K) {
            sharedA[threadIdx.y * blockDim.x + threadIdx.x] = A[row * K + (i + threadIdx.x)];
        }
        if ((i + threadIdx.y) < K && col < M) {
            sharedB[threadIdx.y * blockDim.x + threadIdx.x] = B[(i + threadIdx.y) * M + col];
        }
        __syncthreads();

        for (int j = 0; j < blockDim.x; ++j) {
            sum += sharedA[threadIdx.y * blockDim.x + j] * sharedB[j * blockDim.x + threadIdx.x];
        }
        __syncthreads();
    }

    // Write result to C
    if (row < N && col < M) {
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel_A(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if row and col are within bounds
    if (row < N && col < M) {
        float sum = 0.f;

        // Use shared memory for better memory access
        __shared__ float shared_A[32]; // Assuming block size is 32, adjust if different
        __shared__ float shared_B[32]; // Assuming block size is 32, adjust if different

        for (int i = 0; i < K; i += 32) {
            shared_A[threadIdx.y] = A[row * K + i + threadIdx.y];
            shared_B[threadIdx.x] = B[(i + threadIdx.x) * M + col];

            __syncthreads(); // Sync shared memory

            // Use shared memory for computation
            for (int j = 0; j < 32; ++j) {
                sum += shared_A[j] * shared_B[j];
            }

            __syncthreads(); // Ensure complete computation before next iteration
        }

        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
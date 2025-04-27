#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel_A(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    // Use shared memory to optimize memory access
    extern __shared__ float shared_mem[];
    float* shared_A = shared_mem;
    float* shared_B = shared_mem + blockDim.y * K;

    // Calculate thread indices
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    float sum = 0.f;
    for (int i = 0; i < K; i += blockDim.y) {
        // Load A and B into shared memory
        if (row < N && (i + threadIdx.y) < K) {
            shared_A[threadIdx.y * K + i + threadIdx.x] = A[row * K + i + threadIdx.x];
        }
        if (col < M && (i + threadIdx.y) < K) {
            shared_B[threadIdx.y * K + i + threadIdx.x] = B[(i + threadIdx.y) * M + col];
        }
        
        // Synchronize after loading to shared memory
        __syncthreads();

        // Compute partial sum using shared memory
        for (int j = 0; j < blockDim.y; ++j) {
            sum += shared_A[threadIdx.y * K + j] * shared_B[j * M + threadIdx.x];
        }

        // Synchronize before next iteration
        __syncthreads();
    }
    
    // Write the result to C
    if (row < N && col < M) {
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
    }
}
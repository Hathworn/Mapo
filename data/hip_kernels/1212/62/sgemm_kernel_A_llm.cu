#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sgemm_kernel_A(const float *A, const float *B, float *C, int N, int M, int K, float alpha, float beta)
{
    __shared__ float shared_A[32][32];  // Shared memory for tile of matrix A
    __shared__ float shared_B[32][32];  // Shared memory for tile of matrix B

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int col = blockIdx.x * blockDim.x + tx;
    int row = blockIdx.y * blockDim.y + ty;

    float sum = 0.f;

    // Loop over tiles
    for (int m = 0; m < (K + 32 - 1) / 32; ++m) {
        // Load data into shared memory
        if (m * 32 + tx < K && row < N)
            shared_A[ty][tx] = A[row * K + m * 32 + tx];
        else
            shared_A[ty][tx] = 0.f;

        if (m * 32 + ty < K && col < M)
            shared_B[ty][tx] = B[(m * 32 + ty) * M + col];
        else
            shared_B[ty][tx] = 0.f;

        __syncthreads();  // Synchronize to make sure the matrices are loaded

        // Compute partial product
        for (int e = 0; e < 32; ++e)
            sum += shared_A[ty][e] * shared_B[e][tx];

        __syncthreads();  // Synchronize before loading the new tile
    }

    if (row < N && col < M)
        C[row * M + col] = alpha * sum + beta * C[row * M + col];
}
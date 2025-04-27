#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_matrix_mult(float *A, float *B, float *C, int n)
{
    // Calculate row col only once
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < n && col < n) {
        float sum = 0.0f; // Use local accumulator
        for (int i = 0; i < n; ++i) {
            sum += A[row * n + i] * B[i * n + col];
        }
        C[row * n + col] = sum; // Only write to C once
    }
}
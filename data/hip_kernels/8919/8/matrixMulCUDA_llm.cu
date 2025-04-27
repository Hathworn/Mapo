#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMulCUDA(float *C, float *A, float *B, int n)
{
    // Calculate the global row and column index for each thread
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0.0f;

    // Check boundary conditions
    if (row < n && col < n) {
        for (int k = 0; k < n; k++) {
            sum += A[row * n + k] * B[k * n + col]; // Compute partial dot-product
        }
        C[row * n + col] = sum; // Store the result
    }
}
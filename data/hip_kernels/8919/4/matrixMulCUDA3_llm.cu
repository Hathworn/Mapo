#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMulCUDA3(float *C, float *B, float *A, int n)
{
    // Calculate the row and column index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize sum variable
    float sum = 0.0f;

    // Check if row and col are within matrix size
    if (row < n && col < n) {
        // Loop to perform dot product for the matrix multiplication
        for (int k = 0; k < n; k++) {
            sum += A[row * n + k] * B[k * n + col];
        }
        // Store the result
        C[row * n + col] = sum;
    }
}
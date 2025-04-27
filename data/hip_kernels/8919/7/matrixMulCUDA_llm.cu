#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the matrix multiplication kernel
__global__ void matrixMulCUDA(float *C, float *A, float *B, int n)
{
    // Calculate row and column indices for C
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Boundary check for threads
    if (row < n && col < n) {
        float sum = 0.0f;
        
        // Accumulate product sum
        for (int k = 0; k < n; k++) {
            sum += A[row * n + k] * B[k * n + col];
        }
        
        // Store the result in C
        C[row * n + col] = sum;
    }
}
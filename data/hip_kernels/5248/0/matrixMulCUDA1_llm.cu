#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for matrix multiplication
__global__ void matrixMulCUDA1(float *C, float *A, float *B, int n) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;  // Calculate global row index
    int col = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global column index
    
    if (row < n && col < n) { // Boundary check to prevent out of bounds access
        float sum = 0.0f;
        for (int k = 0; k < n; ++k) { 
            sum += A[row * n + k] * B[k * n + col];  // Perform dot product
        }
        C[row * n + col] = sum; // Store the result
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMul(double *a, double *b, double *C, int cols, int rows, int cols2) {
    // Calculate global row and column index for the element
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure the thread is within matrix bounds
    if (row < rows && col < cols) {
        double sum = 0.0; // Accumulate result in a local variable
        for (int k = 0; k < cols2; ++k) {
            sum += b[k * cols + col] * a[row * cols2 + k];
        }
        C[row * cols + col] = sum; // Assign accumulated sum to matrix C
    }
}
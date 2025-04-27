#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMul(double *a, double *b, double *C, int cols, int rows, int cols2) 
{
    // Calculate global row and column index using threadIdx.x and threadIdx.y
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Check the boundary condition
    if (row < rows && col < cols) {
        double sum = 0;  // Initialize accumulator for the dot product
        // Use a loop to accumulate the dot product
        for (int k = 0; k < cols2; k++) {
            sum += b[k * cols + col] * a[row * cols2 + k];
        }
        // Write the computed value to the result matrix
        C[row * cols + col] = sum;
    }
}
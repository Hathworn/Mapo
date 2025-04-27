#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMul(double* a, double* b, double* C, int cols, int rows, int cols2)
{
    // Calculate the row and col for the current thread
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the thread is within bounds
    if (row < rows && col < cols) {
        double sum = 0.0; // Initialize local accumulator
        // Perform partial product sum using shared memory 
        for (int k = 0; k < cols2; k++) {
            sum += b[k * cols + col] * a[row * cols2 + k];
        }
        C[row * cols + col] = sum; // Store computed result in matrix C
    }
}
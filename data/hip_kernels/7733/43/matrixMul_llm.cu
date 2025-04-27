#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMul(double *a, double *b, double *C, int cols, int rows, int cols2) {
    int row = blockIdx.y * blockDim.y + threadIdx.y; // Transpose block indices to utilize coalesced memory access
    int col = blockIdx.x * blockDim.x + threadIdx.x; // Transpose block indices to utilize coalesced memory access

    if (row < rows && col < cols) {
        double sum = 0; // Use a local variable to accumulate the sum
        for (int k = 0; k < cols2; k++) {
            sum += b[k * cols + col] * a[row * cols2 + k];
        }
        C[row * cols + col] = sum; // Assign accumulated sum to C
    }
}
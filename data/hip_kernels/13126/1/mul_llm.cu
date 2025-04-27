#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
__global__ void mul(double* A, double* B, double* C, int size) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;  // Calculate row index using 2D grid
    int col = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate column index using 2D grid

    if (row < size && col < size) {
        double sum = 0.0;
        // Perform dot product for A's row and B's column
        for (int k = 0; k < size; k++) {
            sum += A[row * size + k] * B[k * size + col];
        }
        C[row * size + col] = sum;  // Store result in C
    }
}
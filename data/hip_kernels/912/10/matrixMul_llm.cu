#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMul(int *A, int *B, int *C, int n) {
    // Calculate the global row and column indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if row and column are within matrix bounds
    if (row < n && col < n) {
        // Use register variable for temporary value
        int Cvalue = 0;
        // Loop to perform the dot product
        for (int i = 0; i < n; i++) {
            Cvalue += A[row * n + i] * B[i * n + col];
        }
        // Write the result back to the global memory
        C[row * n + col] = Cvalue;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposedMatrixKernel(int* d_a, int* d_b, int N) {
    // Calculate global row and column indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Transpose only if indices are within matrix bounds
    if (row < N && col < N) {
        // Perform transpose operation
        d_b[col * N + row] = d_a[row * N + col];
    }
}
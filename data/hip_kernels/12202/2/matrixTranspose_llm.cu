#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixTranspose(unsigned int* A_d, unsigned int *T_d, int n) {
    // Calculate global row and column index for the thread
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Transpose the matrix only if indices are within bounds
    if (row < n && col < n) {
        T_d[col * n + row] = A_d[row * n + col];
    }
}
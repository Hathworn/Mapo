#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transpose(int N, double *A)
{
    // Calculate row and column indices using 2D mapping for better readability
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure indices are within matrix bounds and reduce unnecessary swaps
    if (row < N && col < N && row < col) {
        double temp = A[row * N + col];
        A[row * N + col] = A[col * N + row];
        A[col * N + row] = temp;
    }
}
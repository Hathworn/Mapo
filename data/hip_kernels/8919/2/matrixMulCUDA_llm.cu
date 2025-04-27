```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixMulCUDA(float *C, float *A, float *B, int n)
{
    // Use blockIdx and blockDim to calculate global row and col
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;
    if (row >= n || col >= n) {
        return;
    }
    float sum = 0.0f;
    for (int k = 0; k < n; k++) {
        sum += A[row * n + k] * B[k * n + col];
    }
    C[row * n + col] = sum;
}
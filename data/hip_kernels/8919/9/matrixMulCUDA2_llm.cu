```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__global__ void matrixMulCUDA2(float *C, float *A, float *B, int n)
{
    // Compute global row and column indexes
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds
    if (row < n && col < n) {
        // Calculate the dot product for C[row, col]
        float sum = 0.0f;
        for (int k = 0; k < n; k++) {
            sum += A[row * n + k] * B[k * n + col];
        }
        // Store the result in C
        C[row * n + col] = sum;
    }
}
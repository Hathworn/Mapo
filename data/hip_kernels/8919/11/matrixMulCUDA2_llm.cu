#include "hip/hip_runtime.h"
#include "includes.h"
#define TILE_WIDTH 16

__global__ void matrixMulCUDA2(float *C, float *A, float *B, int n)
{
    // Calculate row and column index for each thread
    int row = blockIdx.y * TILE_WIDTH + threadIdx.y;
    int col = blockIdx.x * TILE_WIDTH + threadIdx.x;

    // Initialize sum for the current element (register optimization)
    float sum = 0.0f;

    // Ensure threads within bounds
    if (row < n && col < n) {
        // Compute dot product for the row and column
        for (int k = 0; k < n; k++) {
            sum += A[row * n + k] * B[k * n + col];
        }

        // Write back the computed value to global memory
        C[row * n + col] = sum;
    }
}
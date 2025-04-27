#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 32
#define N 2048

__global__ void matMult(float* A, float* B, float* C) {
    // Block and thread indices
    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    __shared__ float As[BLOCK_SIZE][BLOCK_SIZE]; // Shared memory for A
    __shared__ float Bs[BLOCK_SIZE][BLOCK_SIZE]; // Shared memory for B

    // Initialize sum
    float sum = 0.0;

    // Compute global indices
    int row = by * BLOCK_SIZE + ty;
    int col = bx * BLOCK_SIZE + tx;

    for (int m = 0; m < N / BLOCK_SIZE; ++m) {
        // Load A and B in shared memory
        As[ty][tx] = A[row * N + m * BLOCK_SIZE + tx];
        Bs[ty][tx] = B[(m * BLOCK_SIZE + ty) * N + col];

        // Synchronize threads
        __syncthreads();

        // Compute partial sum
        for (int k = 0; k < BLOCK_SIZE; ++k) {
            sum += As[ty][k] * Bs[k][tx];
        }

        // Synchronize threads
        __syncthreads();
    }

    // Write result to C
    C[row * N + col] = sum;
}
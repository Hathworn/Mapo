#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16 // Define block size

__global__ void matrixMultKernel(float *d_A, float *d_B, float *d_C, int N) {
    // Shared memory for sub-matrices
    __shared__ float A_shared[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float B_shared[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.y * BLOCK_SIZE + threadIdx.y;
    int col = blockIdx.x * BLOCK_SIZE + threadIdx.x;
    float Cvalue = 0;

    for (int m = 0; m < N / BLOCK_SIZE; ++m) {
        // Load data into shared memory
        if (row < N && (m * BLOCK_SIZE + threadIdx.x) < N) {
            A_shared[threadIdx.y][threadIdx.x] = d_A[row * N + m * BLOCK_SIZE + threadIdx.x];
        } else {
            A_shared[threadIdx.y][threadIdx.x] = 0.0;
        }
        if (col < N && (m * BLOCK_SIZE + threadIdx.y) < N) {
            B_shared[threadIdx.y][threadIdx.x] = d_B[(m * BLOCK_SIZE + threadIdx.y) * N + col];
        } else {
            B_shared[threadIdx.y][threadIdx.x] = 0.0;
        }

        __syncthreads();

        // Compute partial dot product
        for (int k = 0; k < BLOCK_SIZE; ++k) {
            Cvalue += A_shared[threadIdx.y][k] * B_shared[k][threadIdx.x];
        }

        __syncthreads();
    }

    if (row < N && col < N) {
        d_C[row * N + col] = Cvalue; // Write back the computed value
    }
}
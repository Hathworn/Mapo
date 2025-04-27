#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultiplicationKernel(float* A, float* B, float* C, int N) {
    int ROW = blockIdx.y * blockDim.y + threadIdx.y;
    int COL = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Initialize temporary sum for each thread
    float tmpSum = 0;

    // Check if within matrix bounds
    if (ROW < N && COL < N) {
        // Use shared memory for sub-matrices
        __shared__ float sharedA[16][16];
        __shared__ float sharedB[16][16];

        for (int m = 0; m < (N + 15) / 16; ++m) {
            // Load data into shared memory
            if (m * 16 + threadIdx.x < N && ROW < N)
                sharedA[threadIdx.y][threadIdx.x] = A[ROW * N + m * 16 + threadIdx.x];
            else
                sharedA[threadIdx.y][threadIdx.x] = 0.0;

            if (m * 16 + threadIdx.y < N && COL < N)
                sharedB[threadIdx.y][threadIdx.x] = B[(m * 16 + threadIdx.y) * N + COL];
            else
                sharedB[threadIdx.y][threadIdx.x] = 0.0;

            // Synchronize to ensure all threads have loaded their sub-matrices
            __syncthreads();

            // Perform multiplication on the sub-matrix
            for (int e = 0; e < 16; ++e)
                tmpSum += sharedA[threadIdx.y][e] * sharedB[e][threadIdx.x];

            // Synchronize again to ensure all threads have finished computing
            __syncthreads();
        }
    }

    // Write back the result to the global matrix
    if (ROW < N && COL < N)
        C[ROW * N + COL] = tmpSum;
}
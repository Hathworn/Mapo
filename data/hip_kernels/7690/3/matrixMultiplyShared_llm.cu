#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16

__global__ void matrixMultiplyShared(float *A, float *B, float *C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    // Declare shared memory for tiles of A and B
    __shared__ float sharedA[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float sharedB[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.y * BLOCK_SIZE + threadIdx.y;
    int col = blockIdx.x * BLOCK_SIZE + threadIdx.x;
    float value = 0.0;

    // Loop over tiles of matrices A and B
    for (int tileIdx = 0; tileIdx < (numAColumns + BLOCK_SIZE - 1) / BLOCK_SIZE; ++tileIdx) {
        // Load data into shared memory if within bounds
        if (row < numARows && tileIdx * BLOCK_SIZE + threadIdx.x < numAColumns)
            sharedA[threadIdx.y][threadIdx.x] = A[row * numAColumns + tileIdx * BLOCK_SIZE + threadIdx.x];
        else
            sharedA[threadIdx.y][threadIdx.x] = 0.0;
        
        if (col < numBColumns && tileIdx * BLOCK_SIZE + threadIdx.y < numBRows)
            sharedB[threadIdx.y][threadIdx.x] = B[(tileIdx * BLOCK_SIZE + threadIdx.y) * numBColumns + col];
        else
            sharedB[threadIdx.y][threadIdx.x] = 0.0;

        __syncthreads();  // Synchronize threads within a block

        // Compute local dot product
        for (int k = 0; k < BLOCK_SIZE; ++k) {
            value += sharedA[threadIdx.y][k] * sharedB[k][threadIdx.x];
        }

        __syncthreads();  // Synchronize threads before loading new tiles
    }

    // Write value to C if within bounds
    if (row < numCRows && col < numCColumns) {
        C[row * numCColumns + col] = value;
    }
}
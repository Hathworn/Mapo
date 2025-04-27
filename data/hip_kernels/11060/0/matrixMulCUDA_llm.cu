#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory to optimize memory access
__global__ void matrixMulCUDA(int *A, int *B, int *C) {
    // Shared memory for sub-matrices
    __shared__ int shared_A[13][13];
    __shared__ int shared_B[13][13];

    // Thread index
    int row = threadIdx.x;
    int col = threadIdx.y;

    int multi = 0;

    // Load elements into shared memory
    shared_A[row][col] = A[(row * 13) + col];
    shared_B[row][col] = B[(row * 13) + col];
    __syncthreads();

    // Perform multiplication using shared memory
    for (int j = 0; j < 13; j++) {
        multi += shared_A[row][j] * shared_B[j][col];
    }

    // Write the computed value to the result matrix
    C[(row * 13) + col] = multi + shared_A[row][col] + shared_B[row][col];
}
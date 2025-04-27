#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mysgemm(int m, int n, int k, const float *A, const float *B, float* C) {

/********************************************************************
*
* Compute C = A x B
*   where A is a (m x k) matrix
*   where B is a (k x n) matrix
*   where C is a (m x n) matrix
*
********************************************************************/

// Calculate global row and column indices
int row = blockIdx.y * blockDim.y + threadIdx.y;
int col = blockIdx.x * blockDim.x + threadIdx.x;

// Check boundary conditions
if(row < m && col < n) {
    float acc = 0;

    // Use unrolling for the accumulation loop to improve performance
    int index;
    for(index = 0; index < (k - 4); index += 4) {
        acc += A[row * k + index] * B[index * n + col];
        acc += A[row * k + index + 1] * B[(index + 1) * n + col];
        acc += A[row * k + index + 2] * B[(index + 2) * n + col];
        acc += A[row * k + index + 3] * B[(index + 3) * n + col];
    }
    // Handle remaining iterations
    for(; index < k; index++) {
        acc += A[row * k + index] * B[index * n + col];
    }

    // Write the result
    C[row * n + col] = acc;
}
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMul(int* A, int* B, int* C, int aF, int aC, int bF, int bC, int cF, int cC) {
    // Compute each thread's global row and column index
    int row = (blockIdx.y * blockDim.y) + threadIdx.y;
    int col = (blockIdx.x * blockDim.x) + threadIdx.x;

    if (aC != bF) return; // Early exit if dimensions don't match

    // Ensure threads operate within bounds
    if ((row < aF) && (col < bC)) {
        int sum = 0; // Use a local variable to accumulate results
        for (int k = 0; k < aC; ++k) {
            // Perform and accumulate multiplication
            sum += A[row * aC + k] * B[k * bC + col];
        }
        C[row * cC + col] = sum; // Write result to global memory
    }
}
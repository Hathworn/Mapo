#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void colMul(float* a, float* b, float* c, int M, int N) {
    // Calculate global row index
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread is within bounds
    if (row < M) {
        // Precompute column offset
        int colOffset = blockIdx.y * M;
        // Compute global element index
        int globalIndex = row + colOffset;
        // Perform multiplication
        c[globalIndex] = a[globalIndex] * b[row];
    }
}
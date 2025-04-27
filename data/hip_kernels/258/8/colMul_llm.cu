```cuda
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void colMul(float* a, float* b, float* c, int M, int N) {
    // Calculate row and column indices
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure indices are within bounds
    if (row < M && col < N) {
        int ind = row + col * M; // Compute linear index for matrix `a` and `c`
        c[ind] = a[ind] * b[row]; // Perform element-wise multiplication
    }
}
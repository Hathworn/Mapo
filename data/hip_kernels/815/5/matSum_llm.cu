```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matSum(float* S, float* A, float* B, int N) {
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate the linear thread id based on 2D grid for N x N matrix
    if (i < N && j < N) { // Add boundary check to prevent out-of-bounds
        int tid = i * N + j; // Use tid calculation within boundary check
        S[tid] = A[tid] + B[tid];
    }
}
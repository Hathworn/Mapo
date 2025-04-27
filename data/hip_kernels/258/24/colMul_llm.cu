#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void colMul(float* a, float* b, float* c, int M, int N) {
    // Calculate 2D thread index using block and thread indices
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure within bounds
    if (i < M && j < N) {
        int ind = i + j * M;
        c[ind] = a[ind] * b[i];
    }
}
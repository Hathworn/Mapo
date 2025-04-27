#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void colMul(float* a, float* b, float* c, int M, int N) {
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y;
    
    // Process only valid columns
    if (col < M) {
        int ind = col + row * M;
        c[ind] = a[ind] * b[col];
    }
}
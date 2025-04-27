#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixAddKernel2(float* ans, float* M, float* N, int size) {
    // Use both row and column indices to fully utilize thread parallelism
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure both row and col are within bounds
    if(row < size && col < size) {
        int index = row * size + col;
        ans[index] = M[index] + N[index];
    }
}
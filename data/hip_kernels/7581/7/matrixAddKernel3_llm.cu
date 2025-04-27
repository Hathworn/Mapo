#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixAddKernel3(float* ans, float* M, float* N, int size) {
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = row * size + col;

    // Ensure both row and col are within bounds
    if (row < size && col < size) {
        ans[idx] = M[idx] + N[idx];
    }
}
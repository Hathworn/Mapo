#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixAddKernel1(float* ans, float* M, float* N, int size) {
    // Use shared memory to optimize memory access
    __shared__ float sharedM[blockDim.y][blockDim.x];
    __shared__ float sharedN[blockDim.y][blockDim.x];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory
    if (row < size && col < size) {
        sharedM[threadIdx.y][threadIdx.x] = M[row * size + col];
        sharedN[threadIdx.y][threadIdx.x] = N[row * size + col];
    }

    __syncthreads();  // Ensure shared memory is loaded

    // Perform addition using shared memory
    if (row < size && col < size) {
        ans[row * size + col] = sharedM[threadIdx.y][threadIdx.x] + sharedN[threadIdx.y][threadIdx.x];
    }
}
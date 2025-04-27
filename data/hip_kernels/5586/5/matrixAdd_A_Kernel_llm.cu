#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixAdd_A_Kernel(float* A, float* B, float* C, size_t pitch, int width) {

    // Using shared memory for better locality and reduced global memory access latency
    __shared__ float sA[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float sB[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;
    int rowWidthWithPad = pitch / sizeof(float);

    // Load data from global memory to shared memory
    if (row < width && col < width) {
        sA[threadIdx.x][threadIdx.y] = A[row * rowWidthWithPad + col];
        sB[threadIdx.x][threadIdx.y] = B[row * rowWidthWithPad + col];
    }
    __syncthreads();  // Ensure all data is loaded before proceeding

    // Only proceed if within bounds
    if (row < width && col < width) {
        // Compute and store into global memory
        C[row * rowWidthWithPad + col] = sA[threadIdx.x][threadIdx.y] + sB[threadIdx.x][threadIdx.y];
    }
}
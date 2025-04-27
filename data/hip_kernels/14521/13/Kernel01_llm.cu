#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Kernel01(int N, int M, int P, float *A, float *B, float *C) {

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for A and B to optimize memory access
    __shared__ float sharedA[BLOCK_DIM_Y][BLOCK_DIM_X];
    __shared__ float sharedB[BLOCK_DIM_X][BLOCK_DIM_Y];
    
    float tmp = 0.0f;

    // Load data into shared memory
    if (row < N && col < P) {
        sharedA[threadIdx.y][threadIdx.x] = A[row * P + col];
        sharedB[threadIdx.y][threadIdx.x] = B[col * N + row];
    }
    __syncthreads();

    // Compute using shared memory
    if (row < N && col < M) {
        for (int k = 0; k < P; k++) {
            tmp += sharedA[threadIdx.y][k] * sharedB[k][threadIdx.x];
        }
        C[row * N + col] = tmp;
    }
}
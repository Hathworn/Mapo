#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Kernel01(int N, int M, int P, float *A, float *B, float *C) {
    // Use shared memory to optimize memory access
    __shared__ float sharedA[32][32]; // Assuming block size of 32x32
    __shared__ float sharedB[32][32];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    float tmp = 0.0;

    for (int tile = 0; tile < (P + 31) / 32; ++tile) {
        // Load data into shared memory and synchronize
        if (row < N && (tile * 32 + threadIdx.x) < P)
            sharedA[threadIdx.y][threadIdx.x] = A[row * P + tile * 32 + threadIdx.x];
        else
            sharedA[threadIdx.y][threadIdx.x] = 0.0;

        if (col < M && (tile * 32 + threadIdx.y) < P)
            sharedB[threadIdx.y][threadIdx.x] = B[(tile * 32 + threadIdx.y) * M + col];
        else
            sharedB[threadIdx.y][threadIdx.x] = 0.0;

        __syncthreads();

        // Perform computation using shared memory
        for (int k = 0; k < 32; ++k) {
            tmp += sharedA[threadIdx.y][k] * sharedB[k][threadIdx.x];
        }
        __syncthreads();
    }

    if (row < N && col < M) {
        C[row * M + col] = tmp;
    }
}
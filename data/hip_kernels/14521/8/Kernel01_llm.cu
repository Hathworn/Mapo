#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Kernel01(int N, int M, int P, float *A, float *B, float *C) {
    __shared__ float sA[SIZE][SIZE];
    __shared__ float sB[SIZE][SIZE];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int row = by * SIZE + ty;
    int col = bx * SIZE + tx;

    float tmp = 0.0;
    for (int m = 0; m < (P / SIZE); m++) {
        // Load tiles into shared memory
        sA[ty][tx] = A[row * P + m * SIZE + tx];
        sB[ty][tx] = B[col + (m * SIZE + ty) * M];
        __syncthreads();

        // Compute partial dot-product
        #pragma unroll  // Unroll the loop for better performance
        for (int k = 0; k < SIZE; k++)
            tmp += sA[ty][k] * sB[k][tx];

        __syncthreads();
    }

    // Store the result in matrix C
    C[row * M + col] = tmp;
}
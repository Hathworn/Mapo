#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZE 16  // Define SIZE as per requirement

__global__ void Kernel11(int N, int M, int P, float *A, float *B, float *C) {

    __shared__ float sA[SIZE][SIZE];
    __shared__ float sB[SIZE][SIZE];

    int bx = blockIdx.x;  
    int by = blockIdx.y;
    int tx = threadIdx.x; 
    int ty = threadIdx.y;
    int row = by * SIZE + ty;
    int col = bx * SIZE + tx;
    float tmp = 0.0;

    for (int m = 0; m < P; m += SIZE) {
        // Load shared memory with boundary check
        sA[ty][tx] = (row < N && (m + tx) < P) ? A[row * P + m + tx] : 0.0f;
        sB[ty][tx] = (col < M && (m + ty) < P) ? B[col + (m + ty) * M] : 0.0f;
        __syncthreads();

        // Perform multiplication
        #pragma unroll  // Unroll loop for better performance
        for (int k = 0; k < SIZE; k++) {
            tmp += sA[ty][k] * sB[k][tx];
        }
        __syncthreads();
    }

    // Store the result in the output matrix C with boundary check
    if ((row < N) && (col < M)) {
        C[row * M + col] = tmp;
    }
}
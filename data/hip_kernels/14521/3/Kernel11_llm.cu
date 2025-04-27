#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Kernel11(int N, int M, int P, float *A, float *B, float *C) {

    __shared__ float sA[SIZE][SIZE]; 
    __shared__ float sB[SIZE][SIZE];

    int bx = blockIdx.x; int by = blockIdx.y;
    int tx = threadIdx.x; int ty = threadIdx.y;
    int row = by * SIZE + ty;
    int col = bx * SIZE + tx;

    float tmp = 0.0f;
    int iter = P % SIZE;
    
    // Loop over all blocks of A and B to accumulate results
    for (int m = 0; m < P; m += SIZE) {
        
        // Load elements into shared memory with boundary checks
        if (m + tx < P && row < N) sA[ty][tx] = A[row * P + m + tx];
        else sA[ty][tx] = 0.0f;
        
        if (m + ty < P && col < M) sB[ty][tx] = B[(m + ty) * M + col];
        else sB[ty][tx] = 0.0f;
        
        __syncthreads();
        
        // Perform matrix multiplication on tile
        for (int k = 0; k < SIZE; k++) {
            tmp += sA[ty][k] * sB[k][tx];
        }
        
        __syncthreads();
    }

    // Write result to the output matrix C
    if (row < N && col < M) {
        C[row * M + col] = tmp;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

#define N 32

__global__ void multSquareMatrix(int *A, int *B, int *result, int n)
{
    __shared__ int shared_A[N][N];
    __shared__ int shared_B[N][N];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    
    int row = by * blockDim.y + ty;
    int col = bx * blockDim.x + tx;
    int sum = 0;
    
    for (int m = 0; m < (n + N - 1) / N; m++) {
        // Load data into shared memory
        if (row < n && (m * N + tx) < n) {
            shared_A[ty][tx] = A[row * n + m * N + tx];
        } else {
            shared_A[ty][tx] = 0;
        }

        if (col < n && (m * N + ty) < n) {
            shared_B[ty][tx] = B[(m * N + ty) * n + col];
        } else {
            shared_B[ty][tx] = 0;
        }
        
        __syncthreads();  // Synchronize threads

        for (int k = 0; k < N; k++) {
            sum += shared_A[ty][k] * shared_B[k][tx];
        }
        
        __syncthreads();  // Synchronize again for loading new blocks
    }
    
    if (row < n && col < n) {
        result[row * n + col] = sum;
    }
}
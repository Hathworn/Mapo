#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiplication(int * A, int * B, int * C, int N, int M, int K) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < N && col < K) { // Check bounds
        int sum = 0;
        for (int i = 0; i < M; i++) {
            sum += A[row * M + i] * B[i * K + col]; // Correct index calculation for matrix multiplication
        }
        C[row * K + col] = sum; // Correct index calculation for result matrix
    }
}
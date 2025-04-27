#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Kernel01 (int N, int M, int P, float *A, float *B, float *C) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < N && col < M) {
        float tmp = 0.0;

        // Use pointer arithmetic to improve memory access patterns
        float* aRow = A + row * P;
        float* bCol = B + col;

        for (int k = 0; k < P; k++) {
            tmp += aRow[k] * bCol[k * N];
        }

        C[row * N + col] = tmp;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Kernel00(int N, int M, int P, float *A, float *B, float *C) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < M && col < N) { // Ensure threads remain within bounds
        float tmp = 0.0f;
        for (int k = 0; k < P; k++) {
            tmp += A[row * P + k] * B[k * N + col];
        }
        C[row * N + col] = tmp;
    }
}
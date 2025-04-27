#include "hip/hip_runtime.h"
#include "includes.h"
const int N = 32;

__global__ void mul(int* A, int* B, int* C) {
    // Cache thread index
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int lig = blockIdx.y * blockDim.y + threadIdx.y;

    // Cache the current index of the result matrix
    int index = lig * N + col;

    if (col < N && lig < N) {
        int inter = 0;

        // Loop with stride to improve memory access pattern
        for (int i = threadIdx.x; i < N; i += blockDim.x) {
            inter += A[lig * N + i] * B[i * N + col];
        }

        C[index] += inter; // Ensure atomicity by accumulating results
    }
}
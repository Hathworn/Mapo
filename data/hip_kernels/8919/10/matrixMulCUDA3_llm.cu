#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMulCUDA3(float *C, float *B, float *A, int n)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row >= n || col >= n) {
        return;
    }

    float sum = 0.0f;
    int rowOffset = row * n;
    
    // Loop unrolling to improve instruction level parallelism
    for (int k = 0; k < n; k += 4) {
        sum += A[rowOffset + k] * B[k * n + col];
        if (k + 1 < n) sum += A[rowOffset + k + 1] * B[(k + 1) * n + col];
        if (k + 2 < n) sum += A[rowOffset + k + 2] * B[(k + 2) * n + col];
        if (k + 3 < n) sum += A[rowOffset + k + 3] * B[(k + 3) * n + col];
    }
    C[rowOffset + col] = sum;
}
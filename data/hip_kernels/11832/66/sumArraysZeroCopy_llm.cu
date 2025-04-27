#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysZeroCopy(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unrolling to improve throughput
    int gridSize = blockDim.x * gridDim.x;
    while (i < N) {
        C[i] = A[i] + B[i];
        i += gridSize;
    }
}
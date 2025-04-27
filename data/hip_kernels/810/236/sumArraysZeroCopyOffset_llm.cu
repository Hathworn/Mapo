#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysZeroCopyOffset(float *A, float *B, float *C, const int N, int offset)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + offset;

    // Unroll loop to improve performance
    if (i - offset < N) {
        C[i] = A[i] + B[i];
    }
}
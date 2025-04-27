#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysZeroCopy(float *A, float *B, float *C, const int N)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}
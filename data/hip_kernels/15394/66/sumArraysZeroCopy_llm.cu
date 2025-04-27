#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysZeroCopy(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use warp-synchronous programming to coalesce memory accesses
    if (i < N) {
        float a = A[i];
        float b = B[i];
        C[i] = a + b;
    }
}
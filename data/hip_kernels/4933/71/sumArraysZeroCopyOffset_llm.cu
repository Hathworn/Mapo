#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysZeroCopyOffset(float *A, float *B, float *C, const int N, int offset)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Move condition check inside to minimize branch divergence
    if (i + offset < N) 
    {
        C[i + offset] = A[i + offset] + B[i + offset];
    }
}
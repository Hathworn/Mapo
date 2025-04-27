#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysZeroCopy(float *A, float *B, float *C, const int N)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check for boundary condition and perform addition
    if (i < N)
    {
        C[i] = A[i] + B[i];
    }
}
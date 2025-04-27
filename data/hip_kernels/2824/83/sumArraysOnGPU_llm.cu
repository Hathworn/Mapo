#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Only perform the calculation if 'i' is within bounds
    if (i < N)
    {
        // Simplified arithmetic operation
        C[i] = A[i] + B[i];
    }
}
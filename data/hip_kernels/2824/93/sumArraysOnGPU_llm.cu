#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Calculate thread's global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bounds and perform computation if valid
    if (i < N)
    {
        C[i] = A[i] + B[i];
    }
}
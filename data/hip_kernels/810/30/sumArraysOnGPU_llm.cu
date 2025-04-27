#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Use blockIdx and blockDim for scalable parallelism
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check against N for boundary condition
    if (i < N) 
        C[i] = A[i] + B[i];
}
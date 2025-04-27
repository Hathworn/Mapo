#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Calculate global thread index for entire grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we don't access out of bounds memory
    if (i < N) C[i] = A[i] + B[i];
}
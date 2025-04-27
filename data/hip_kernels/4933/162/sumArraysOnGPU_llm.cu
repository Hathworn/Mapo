#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Use blockIdx and blockDim to handle larger arrays
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread processes within bounds
    if (i < N) C[i] = A[i] + B[i];
}
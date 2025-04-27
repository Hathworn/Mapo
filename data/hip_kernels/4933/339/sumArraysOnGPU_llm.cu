#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, int n)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we do not exceed the array bounds
    if (i < n) {
        C[i] = A[i] + B[i];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Optimize thread index calculation and avoid redundant operations
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < N) {
        // Directly store result in C without using temporary array
        C[i] = A[i] + B[i];
    }
}
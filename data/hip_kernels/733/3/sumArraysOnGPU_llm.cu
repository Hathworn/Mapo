#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Calculate global index 
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform operation if index is within bounds
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}
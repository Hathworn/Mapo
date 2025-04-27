#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds
    if (idx < N)
    {
        // Perform vector addition
        C[idx] = A[idx] + B[idx];
    }
}
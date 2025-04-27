#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysZeroCopy(float *A, float *B, float *C, const int N)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use if statement outside the loop to avoid branching inside the loop
    if (i < N) {
        // Perform computation
        C[i] = A[i] + B[i];
    }
}
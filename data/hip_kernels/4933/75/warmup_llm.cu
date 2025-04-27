#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global index 
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Ensure within bounds before performing operation
    if (k < n)
    {
        C[k] = A[i] + B[i];
    }
}
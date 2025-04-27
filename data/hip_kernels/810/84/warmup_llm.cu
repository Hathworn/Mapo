#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Use a check to ensure valid memory access
    if (i < n) 
    {
        // Compute only if the index is valid
        C[i] = A[k] + B[k];
    }
}
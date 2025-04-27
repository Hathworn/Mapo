#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Use unsigned int for indexing and compute k efficiently
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Prefetch k to avoid recomputation
    unsigned int k = i + offset;

    // Process only valid elements, use fewer branches
    if (k < n) 
    {
        C[i] = A[k] + B[k];
    }
}
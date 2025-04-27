#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    // Cache the index calculation to improve performance
    unsigned int k = blockIdx.x * blockDim.x + threadIdx.x + offset;

    // Check if within bounds before performing operations
    if (k < n) {
        C[k - offset] = A[k] + B[k]; // Use calculated index directly
    }
}
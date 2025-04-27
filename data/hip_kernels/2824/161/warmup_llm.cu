#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    // Cache thread index and calculate global index once
    unsigned int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = globalIndex + offset;

    // Ensure index calculation to prevent out-of-bound access
    if (k < n) 
    {
        // Perform computation if within bounds
        C[globalIndex] = A[k] + B[k];
    }
}
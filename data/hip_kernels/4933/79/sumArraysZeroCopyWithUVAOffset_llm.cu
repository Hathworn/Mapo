#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArraysZeroCopyWithUVAOffset(float *A, float *B, float *C, const int N, int offset)
{
    // Cache the global thread index to reduce repeated calculations
    int i = blockIdx.x * blockDim.x + threadIdx.x + offset;
    
    // Precompute limit for faster comparison
    int limit = N + offset;

    // Check condition using precomputed limit
    if (i < limit) {
        C[i] = A[i] + B[i];
    }
}
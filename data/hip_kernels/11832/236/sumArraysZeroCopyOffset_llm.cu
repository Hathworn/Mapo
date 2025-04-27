#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArraysZeroCopyOffset(float *A, float *B, float *C, const int N, int offset)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate effective index once for reuse
    int effectiveIndex = i + offset; 
    
    // Check if effective index is within bounds
    if (effectiveIndex < N) {
        C[effectiveIndex] = A[effectiveIndex] + B[effectiveIndex];
    }
}
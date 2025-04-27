#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel definition

__global__ void VecAdd(float* A, float* B, float* C, int nums)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Check if index is within bounds and optimize memory access
    if (i < nums)
    {
        C[i] = A[i] + B[i];
    }
}
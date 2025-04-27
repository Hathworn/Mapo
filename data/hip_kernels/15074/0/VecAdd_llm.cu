#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(double* A, double* B, double* C, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use block and thread index for global indexing
    if (i < n) // Check bounds to avoid accessing out of range
    {
        C[i] = A[i] + B[i];
    }
}
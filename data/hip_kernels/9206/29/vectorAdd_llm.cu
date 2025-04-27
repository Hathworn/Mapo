#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure that each thread computes only if within bounds
    if (i < numElements)
    {
        // Element-wise addition
        C[i] = A[i] + B[i];
    }
}
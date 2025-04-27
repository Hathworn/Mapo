#include "hip/hip_runtime.h"
#include "includes.h"

#define N 1024  // Example size, adjust as needed

// Optimized global kernel function
__global__ void VecAdd(const float* A, const float* B, float* C, int numElements)
{
    // Calculate thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use threads efficiently by checking bounds
    if (i < numElements)
    {
        // Perform vector addition
        C[i] = A[i] + B[i];
    }
}
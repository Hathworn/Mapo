#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function for vector addition
__global__ void VecAdd(const float* __restrict__ A, const float* __restrict__ B, float* __restrict__ C, int N)
{
    // Calculate the index for this thread
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Perform operation only if index is within bounds
    if (i < N)
    {
        // Load values from global to registers for faster access
        float a = A[i];
        float b = B[i];
        
        // Compute the result and store back to global memory
        C[i] = a + b;
    }
}
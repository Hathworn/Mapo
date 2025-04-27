#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(const float* __restrict__ A, const float* __restrict__ B, float* __restrict__ C, int N)
{
    // Calculate global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use if (i < N) to prevent accessing out of bounds
    if (i < N) 
    {
        // Perform vector addition
        C[i] = A[i] + B[i];
    }
}
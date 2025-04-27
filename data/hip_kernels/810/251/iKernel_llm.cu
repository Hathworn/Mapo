#include "hip/hip_runtime.h"
#include "includes.h"

// Use restrict keyword for pointers to improve memory access performance
__global__ void iKernel(float * __restrict__ A, float * __restrict__ B, float * __restrict__ C, const int N)
{
    // Cache the index calculation to avoid recalculation
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Reorganize logic to remove branch divergence
    if (i < N) 
    { 
        C[i] = A[i] + B[i]; 
    }
}
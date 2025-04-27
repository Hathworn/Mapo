#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory for performance improvement
__global__ void VecAdd(float* A, float* B, float* C, int N)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Check bounds before accessing in case of over-indexing
    if(i < N) {
        C[i] = A[i] + B[i];
    }
}
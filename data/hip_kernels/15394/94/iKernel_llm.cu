#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *A, float *B, float *C, const int N)
{
    // Use const for repeated calculations to optimize register usage
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Add bounds check to reduce divergence
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}
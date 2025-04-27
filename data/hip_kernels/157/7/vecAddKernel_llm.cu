#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAddKernel(float* __restrict__ A, float* __restrict__ B, float* __restrict__ C, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < n) // Boundary check for threads.
    {
        C[i] = A[i] + B[i]; // Use of __restrict__ to improve memory access
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(float* __restrict__ A, float* __restrict__ B, float* __restrict__ C, int N)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if(i < N)
    {
        // Load values before use
        float a = A[i];
        float b = B[i];
        C[i] = a + b;
    }
}
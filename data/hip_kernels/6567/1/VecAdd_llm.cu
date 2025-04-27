#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VecAdd(const float* __restrict__ A, const float* __restrict__ B, float* __restrict__ C, int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Apply bounds check only once
    if (i < N)
    {
        C[i] = A[i] + B[i];
    }
}
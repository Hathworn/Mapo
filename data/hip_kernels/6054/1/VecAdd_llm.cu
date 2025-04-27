#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(const float* __restrict__ A, const float* __restrict__ B, float* __restrict__ C, int N)
{
    // Calculate global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Loop unrolling for better performance
    if (i < N)
    {
        C[i] = A[i] + B[i];
        if (i + blockDim.x < N) C[i + blockDim.x] = A[i + blockDim.x] + B[i + blockDim.x];
    }
}
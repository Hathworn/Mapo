#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(const float* __restrict__ A, const float* __restrict__ B, float* __restrict__ C, int N)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x; // Calculate global thread index
    if (i < N) 
    {
        C[i] = A[i] + B[i]; // Perform vector addition only if index is within bounds
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VecAdd(const float* __restrict__ A, const float* __restrict__ B, float* __restrict__ C, int N)
{
    // Calculate unique thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Use conditional operator for improved performance
    C[i] = (i < N) ? (A[i] + B[i]) : C[i];
}
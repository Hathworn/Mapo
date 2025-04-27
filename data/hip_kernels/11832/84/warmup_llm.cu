#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float * __restrict__ A, float * __restrict__ B, float * __restrict__ C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Use __restrict__ keyword to enable better optimization.
    if (k < n) C[i] = A[k] + B[k];
}
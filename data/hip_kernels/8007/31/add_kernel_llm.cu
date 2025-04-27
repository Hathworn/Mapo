#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation
    if (idx < N) X[idx * INCX] += ALPHA; // Shortened variable name for better readability
}
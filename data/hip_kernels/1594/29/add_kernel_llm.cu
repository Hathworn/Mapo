#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation
    if(i < N) X[i*INCX] += ALPHA; // Simplified if condition
}
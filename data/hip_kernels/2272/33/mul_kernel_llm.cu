#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified grid indexing
    int totalThreads = blockDim.x * gridDim.x; // Total threads in grid

    for(int idx = i; idx < N; idx += totalThreads) // Loop to cover all elements
    {
        Y[idx * INCY] *= X[idx * INCX]; // Main computation
    }
}
```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index based on 1D grid and block
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to cover all elements efficiently
    for (int i = idx; i < N; i += blockDim.x * gridDim.x)
    {
        X[i * INCX] = ALPHA;
    }
}
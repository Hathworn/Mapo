#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Use grid-stride loop to handle large problems efficiently
    for (; i < N; i += blockDim.x * gridDim.x) 
    {
        X[i * INCX] = ALPHA;
    }
}
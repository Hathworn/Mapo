#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop to handle multiple elements per thread if blockDim.x doesn't cover all elements
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x)
    {
        X[idx * INCX] *= ALPHA;
    }
}
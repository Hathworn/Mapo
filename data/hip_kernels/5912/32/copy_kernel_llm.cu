#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Grid stride loop to efficiently cover all elements
    for (; i < N; i += blockDim.x * gridDim.x)
    {
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}
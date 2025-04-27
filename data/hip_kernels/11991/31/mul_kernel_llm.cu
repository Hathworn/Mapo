#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use a stride loop to cover all elements
    for (; i < N; i += stride)
    {
        Y[i * INCY] *= X[i * INCX];
    }
}
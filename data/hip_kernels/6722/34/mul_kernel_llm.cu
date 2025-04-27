#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds and stride through data
    for (int i = idx; i < N; i += blockDim.x * gridDim.x)
    {
        Y[i * INCY] *= X[i * INCX];
    }
}
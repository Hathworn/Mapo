#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    int stride = blockDim.x * gridDim.x; // Calculate stride based on total threads

    for (int idx = i; idx < N; idx += stride) // Loop to handle larger-than-thread-count data
    {
        Y[idx * INCY] *= X[idx * INCX];
    }
}
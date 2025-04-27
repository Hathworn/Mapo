#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = gridDim.x * blockDim.x;
    // Loop to enhance data processing for larger arrays
    for (; i < N; i += totalThreads) {
        Y[i * INCY] *= X[i * INCX];
    }
}
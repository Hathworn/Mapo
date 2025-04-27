#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global thread index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (; i < N; i += stride) {
        Y[i*INCY] *= X[i*INCX];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block index computation
    int stride = gridDim.x * blockDim.x; // Calculate total number of threads
    for (; i < N; i += stride) { // Loop to cover full range
        Y[i * INCY] *= X[i * INCX];
    }
}
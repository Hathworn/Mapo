#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop to cover all elements if N > total number of threads
    for (; i < N; i += blockDim.x * gridDim.x)
    {
        Y[i * INCY] *= X[i * INCX]; // Perform multiplication
    }
}
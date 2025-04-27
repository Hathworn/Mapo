#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global thread index in one step to reduce arithmetic operations
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Use if-check to ensure we do not access out-of-bound memory
    if (i < N) 
    {
        Y[i * INCY] *= X[i * INCX];
    }
}
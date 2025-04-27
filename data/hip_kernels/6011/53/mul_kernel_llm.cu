#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Optimize thread index calculation for 1D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Use a stride loop to cover all elements
    for(; i < N; i += blockDim.x * gridDim.x)
    {
        Y[i * INCY] *= X[i * INCX];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify thread index calculation for 1D grid
    if(i < N) 
    {
        Y[i * INCY] *= X[i * INCX]; // Perform operation on each element
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global thread index for 1D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use this condition to ensure access within bounds
    if (i < N) {
        // Direct access and operation on Y using calculated index
        Y[i * INCY] *= X[i * INCX];
    }
}
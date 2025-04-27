#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate global thread index using a 1D grid of 1D blocks
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index is within bounds before copying data
    if (i < N)
    {
        Y[i*INCY + OFFY] = X[i*INCX + OFFX];
    }
}
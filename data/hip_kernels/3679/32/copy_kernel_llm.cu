#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Optimize thread index calculation for 1D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use memory coalescing for better performance
    if (i < N) 
    {
        int idxX = i * INCX + OFFX;
        int idxY = i * INCY + OFFY;
        Y[idxY] = X[idxX];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate global index using optimized 1D grid for potentially improved performance
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure that only relevant threads within bounds perform the memory copy operation
    if (i < N)
    {
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}
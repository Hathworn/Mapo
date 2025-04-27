#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Optimize calculation of index using blockIdx.x and blockIdx.y 
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary condition and copy if within limits
    if(globalIdx < N) 
    {
        // Optimized memory access pattern
        Y[globalIdx * INCY + OFFY] = X[globalIdx * INCX + OFFX];
    }
}
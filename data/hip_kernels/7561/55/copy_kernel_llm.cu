#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N,  float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate unique thread index using 1D grid for better memory access pattern
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure threads within valid range
    if (i < N) {
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}
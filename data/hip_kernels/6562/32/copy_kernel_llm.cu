#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate the global index using built-in helper functions for clarity
    int i = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x;

    // Check within bounds and perform copy operation
    if(i < N) {
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}
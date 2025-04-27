#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified the index calculation

    // Optimized memory handling by directly accessing the data
    while (i < N) {
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
        i += blockDim.x * gridDim.x;
    }
}
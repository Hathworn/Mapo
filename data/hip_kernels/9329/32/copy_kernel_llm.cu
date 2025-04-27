#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation
    if (idx < N) {
        Y[idx * INCY + OFFY] = X[idx * INCX + OFFX]; // Access elements directly
    }
}
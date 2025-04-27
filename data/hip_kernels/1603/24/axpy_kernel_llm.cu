#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Use one-dimensional grid for simplicity
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop to load balance among available threads
    for(int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        Y[OFFY + idx * INCY] += ALPHA * X[OFFX + idx * INCX];
    }
}
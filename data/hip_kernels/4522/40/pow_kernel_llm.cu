#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;

    // Loop optimization for memory efficiency and better performance
    for (; i < N; i += gridSize) {
        Y[i * INCY] = pow(X[i * INCX], ALPHA);
    }
}
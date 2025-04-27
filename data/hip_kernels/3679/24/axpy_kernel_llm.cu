#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use loop to increase occupancy and handle larger data sizes
    for (; i < N; i += stride) {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}
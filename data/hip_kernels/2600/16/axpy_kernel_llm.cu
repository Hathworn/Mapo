#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Stride through elements with grid dimension for larger data processing
    for (; i < N; i += blockDim.x * gridDim.x) {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}
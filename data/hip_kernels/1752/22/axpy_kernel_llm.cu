#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation

    // Looping with stride to ensure each thread processes multiple elements if necessary
    for (; i < N; i += blockDim.x * gridDim.x) {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}
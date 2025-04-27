#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate the global thread index more clearly
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride to allow for larger concurrency
    int stride = blockDim.x * gridDim.x;

    // Loop over entire array in strides
    for (; i < N; i += stride) {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}
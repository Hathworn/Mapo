#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate the global index for the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to cover all elements
    for (; i < N; i += blockDim.x * gridDim.x)
    {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}
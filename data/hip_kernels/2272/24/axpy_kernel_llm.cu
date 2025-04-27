#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = gridDim.x * blockDim.x;
    // Use grid-stride loop for better performance
    for (; i < N; i += gridStride)
    {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}
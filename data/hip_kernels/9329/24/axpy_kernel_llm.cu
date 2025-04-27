#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate the global thread index using 3D grid and block size
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Step through increment of block size and perform operation
    for (; i < N; i += blockDim.x * gridDim.x) {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}
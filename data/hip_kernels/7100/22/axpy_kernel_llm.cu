#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate the global thread index using only blockIdx.x
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a while loop to handle multiple iterations per thread
    while (i < N) {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
        i += blockDim.x * gridDim.x; // Move to the next iteration
    }
}
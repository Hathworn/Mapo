#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop through elements that this thread can process
    for (; i < N; i += blockDim.x * gridDim.x) {
        // Perform the AXPY operation
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop over the large data in steps to optimize memory access
    for (; i < N; i += stride) {
        Y[i * INCY] = powf(X[i * INCX], ALPHA); // Use powf for single-precision float
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure all threads are used efficiently using a grid-stride loop
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        Y[idx * INCY] = powf(X[idx * INCX], ALPHA); // Use powf for single precision
    }
}
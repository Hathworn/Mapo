#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate grid stride

    // Loop with grid-stride to process larger datasets
    for (; i < N; i += stride)
    {
        Y[i * INCY] = powf(X[i * INCX], ALPHA); // Use powf for float precision
    }
}
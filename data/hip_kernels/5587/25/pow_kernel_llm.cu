#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Calculate linear thread index within the grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Remove unnecessary computation, blockIdx.y*gridDim.x, to optimize performance
    if (idx < N)
    {
        Y[idx * INCY] = powf(X[idx * INCX], ALPHA); // Use powf() for single precision
    }
}
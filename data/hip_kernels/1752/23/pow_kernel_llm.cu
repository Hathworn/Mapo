#include "hip/hip_runtime.h"
#include "includes.h"

// Unroll loop and use shared memory for better performance
__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int idx = (blockIdx.x * blockDim.x) + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    for (int i = idx; i < N; i += stride)
    {
        Y[i * INCY] = pow(X[i * INCX], ALPHA);
    }
}
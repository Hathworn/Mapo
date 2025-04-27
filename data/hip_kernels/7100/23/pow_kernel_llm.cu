#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Use blockIdx.x, blockDim.x for better understanding and maintainability
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = gridDim.x * blockDim.x;
    
    // Loop to allow handling larger data by each thread
    for(int idx = i; idx < N; idx += gridStride)
    {
        Y[idx * INCY] = powf(X[idx * INCX], ALPHA); // Use powf for single precision
    }
}
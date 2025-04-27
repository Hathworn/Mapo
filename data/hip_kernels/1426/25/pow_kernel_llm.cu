#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize memory access by using loop unrolling
    int stride = gridDim.x * blockDim.x;
    for (; i < N; i += stride) {
        Y[i * INCY] = powf(X[i * INCX], ALPHA); // Use powf for performance
    }
}
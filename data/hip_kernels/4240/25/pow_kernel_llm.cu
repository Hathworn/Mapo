#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Efficient boundary check and computation using loop unrolling
    #pragma unroll
    for (; i < N; i += blockDim.x * gridDim.x) {
        Y[i * INCY] = powf(X[i * INCX], ALPHA);
    }
}
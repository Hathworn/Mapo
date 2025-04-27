#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Single-dimensional index calculation
    int stride = gridDim.x * blockDim.x; // Calculate stride for loop unrolling
    
    for (; i < N; i += stride) { // Loop with stride to handle more elements per thread
        Y[i * INCY] = powf(X[i * INCX], ALPHA); // Use powf for single precision optimization
    }
}
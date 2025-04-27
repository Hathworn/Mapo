#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global thread ID in 1D
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop to process more data if blocks are incomplete
    for (; i < N; i += blockDim.x * gridDim.x) {
        Y[i * INCY] *= X[i * INCX];
    }
}
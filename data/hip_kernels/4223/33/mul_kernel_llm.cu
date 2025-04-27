#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global index directly
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use stride loop to handle larger arrays efficiently
    for (; i < N; i += stride) {
        Y[i * INCY] *= X[i * INCX];
    }
}
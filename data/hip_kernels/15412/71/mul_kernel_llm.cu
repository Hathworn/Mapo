#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a grid-stride loop for better parallel efficiency
    for(; i < N; i += blockDim.x * gridDim.x)
    {
        Y[i * INCY] *= X[i * INCX];
    }
}
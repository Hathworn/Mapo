#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x; 

    // Use grid-stride loop for handling large data and maximizing occupancy
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) 
    {
        Y[i * INCY] *= X[i * INCX];
    }
}
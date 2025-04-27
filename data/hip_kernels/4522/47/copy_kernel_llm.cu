#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize: Use grid-stride loop to allow the kernel to process more elements per thread
    for (int index = i; index < N; index += blockDim.x * gridDim.x)
    {
        Y[index * INCY + OFFY] = X[index * INCX + OFFX];
    }
}
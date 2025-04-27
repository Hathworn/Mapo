#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copy_kernel(int N,  float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop over grid stride
    for(int index = i; index < N; index += gridDim.x * blockDim.x)
    {
        Y[index * INCY + OFFY] = X[index * INCX + OFFX];
    }
}
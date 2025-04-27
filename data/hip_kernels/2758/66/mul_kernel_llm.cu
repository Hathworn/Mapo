```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global thread index more efficiently by utilizing blockIdx.x
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Utilize stride increments to handle more data in a single kernel launch
    int stride = gridDim.x * blockDim.x;
    
    // Loop through data utilizing stride
    for (; i < N; i += stride)
    {
        Y[i * INCY] *= X[i * INCX];
    }
}
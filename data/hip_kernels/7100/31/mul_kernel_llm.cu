#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify grid and block computation
    int gridStride = blockDim.x * gridDim.x; // Calculate the total stride

    for (; i < N; i += gridStride) // Use loop to handle data larger than a block
    {
        Y[i*INCY] *= X[i*INCX]; // Perform operation
    }
}
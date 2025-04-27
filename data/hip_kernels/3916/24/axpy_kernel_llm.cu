#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate the global index for each thread
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Use the index to update the Y array, if within bounds
    if (i < N) 
    {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}
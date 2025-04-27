#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate the global thread index more efficiently using block and thread information
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.y * gridDim.x;
  
    // Ensure that thread index is within bounds
    if (i < N)
    {
        // Perform the copying operation
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}
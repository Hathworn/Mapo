#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use blockIdx and threadIdx to calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Use strided loops for better memory access patterns and occupancy
    for (; i < N; i += gridDim.x * gridDim.y * blockDim.x)
    {
        X[i * INCX] = ALPHA; // Write the constant ALPHA to the stride of INCX
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Stride loop to handle large arrays
    int stride = gridDim.x * blockDim.x;
    for (; i < N; i += stride)
    {
        X[i * INCX] = ALPHA; // Assign ALPHA to each element
    }
}
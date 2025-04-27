#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate unique global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Check boundaries
    if(i < N)
    {
        // Perform computation
        X[i * INCX] = ALPHA;
    }
}
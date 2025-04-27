#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread ID in a more efficient way
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the operation only happens for threads within bounds
    if (i < N) 
    {
        X[i * INCX] *= ALPHA;
    }
}
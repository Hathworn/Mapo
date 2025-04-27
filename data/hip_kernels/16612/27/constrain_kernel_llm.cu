#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop through elements in the grid stride loop
    for(; i < N; i += gridDim.x * blockDim.x)
    {
        // Constrain each element
        X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[i * INCX]));
    }
}
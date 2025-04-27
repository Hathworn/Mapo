#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Check index within bounds and modify X
    if(i < N) 
    {
        float val = X[i * INCX];
        X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, val));
    }
}
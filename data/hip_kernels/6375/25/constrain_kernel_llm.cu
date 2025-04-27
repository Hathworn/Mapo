#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access by using shared memory for ALPHA
__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = (blockIdx.x * blockDim.x) + threadIdx.x;
    if(i < N) 
    {
        float value = X[i*INCX];
        X[i*INCX] = min(ALPHA, max(-ALPHA, value));
    }
}
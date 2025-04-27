#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Optimize thread index calculation and reduce operations
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x; 
    if(i < N)
    {
        X[i * INCX] *= ALPHA; 
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation to 1D grid
    if (i < N) 
    {
        int index = i * INCX; // Precaution for performance: reduce repetitive arithmetic calculation
        X[index] = fminf(ALPHA, fmaxf(-ALPHA, X[index]));
    }
}
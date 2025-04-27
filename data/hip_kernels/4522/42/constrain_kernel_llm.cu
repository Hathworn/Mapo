#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index considering grid and block dimensions
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Ensure the index is within bounds and apply constraints
    if(i < N) X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[i * INCX]));
}
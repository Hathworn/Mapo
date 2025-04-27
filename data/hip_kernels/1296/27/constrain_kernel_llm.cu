#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use GPU's built-in functions to calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockDim.x * gridDim.x * blockIdx.y;
    if(i < N) {
        // Apply constraint using fminf and fmaxf
        float val = X[i * INCX];
        X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, val));
    }
}
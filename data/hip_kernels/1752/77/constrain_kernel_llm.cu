#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify block index calculation
    if(i < N) {
        float value = X[i*INCX];
        X[i*INCX] = fminf(ALPHA, fmaxf(-ALPHA, value)); // Compute constrained value
    }
}
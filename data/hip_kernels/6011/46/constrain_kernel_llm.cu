#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use a single-dimension grid and calculate global index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < N) {
        // Use temporary variable to avoid recalculating index
        int index = i * INCX;
        X[index] = fminf(ALPHA, fmaxf(-ALPHA, X[index]));
    }
}
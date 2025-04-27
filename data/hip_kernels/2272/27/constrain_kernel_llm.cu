#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Initialize a more effective index computation
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Process only within the bounds
    for (int j = idx; j < N; j += blockDim.x * gridDim.x) {
        X[j * INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[j * INCX]));
    }
}
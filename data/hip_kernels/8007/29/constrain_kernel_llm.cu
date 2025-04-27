#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use an improved indexing method to enhance performance.
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop over grid to handle larger arrays.
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        X[idx * INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[idx * INCX]));
    }
}
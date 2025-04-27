#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize thread load balance
    int stride = blockDim.x * gridDim.x;

    // Use loop with stride for handling large N
    for (; i < N; i += stride) {
        X[i*INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[i*INCX]));
    }
}
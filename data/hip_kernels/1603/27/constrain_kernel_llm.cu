#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop for optimal memory access
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        X[idx * INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[idx * INCX]));
    }
}
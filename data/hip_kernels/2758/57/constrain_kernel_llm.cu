#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop for better utilization
    for (; i < N; i += gridDim.x * blockDim.x) {
        X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[i * INCX]));
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop over all elements with the stride of total number of threads
    for (; i < N; i += blockDim.x * gridDim.x) {
        X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[i * INCX]));
    }
}
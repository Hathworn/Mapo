#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll the loop to increase performance
    int stride = blockDim.x * gridDim.x;
    for (; i < N; i += stride) {
        X[i * INCX] *= ALPHA;
    }
}
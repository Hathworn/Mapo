#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure all threads operate within bounds
    for (; i < N; i += blockDim.x * gridDim.x) {
        X[i * INCX] *= ALPHA;
    }
}
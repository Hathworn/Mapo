#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Ensure kernel operation is performed only for valid threads
    if (i * INCX < N) {
        X[i * INCX] = ALPHA;
    }
}
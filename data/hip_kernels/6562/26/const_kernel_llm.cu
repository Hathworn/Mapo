#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process multiple elements with a single thread (loop unrolling)
    for (; i < N; i += blockDim.x * gridDim.x)
    {
        X[i * INCX] = ALPHA;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride to cover entire array
    int stride = gridDim.x * blockDim.x;
    
    // Loop with stride to ensure full coverage
    for (; i < N; i += stride)
    {
        X[i * INCX] = ALPHA;
    }
}
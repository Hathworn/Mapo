#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Compute the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Avoid calculating unnecessary values and improve warp efficiency
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x)
    {
        X[idx * INCX] = ALPHA;
    }
}
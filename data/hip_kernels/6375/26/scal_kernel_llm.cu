#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use threadIdx.y for better access pattern
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int idx = i * INCX;
    
    // Unrolling to improve performance
    for (; idx < N * INCX; idx += INCX * blockDim.x)
    {
        X[idx] *= ALPHA;
    }
}
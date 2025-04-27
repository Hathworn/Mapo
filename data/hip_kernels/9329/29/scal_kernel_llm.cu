#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index with 1D grid and block configuration
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by checking from i to i + blockDim.x * gridDim.x for continuous memory access
    for(; i < N; i += blockDim.x * gridDim.x)
    {
        X[i * INCX] *= ALPHA;
    }
}
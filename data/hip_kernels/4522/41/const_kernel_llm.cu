#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    // Unroll the loop to improve memory access efficiency
    int stride = gridDim.x * gridDim.y * blockDim.x;
    for (int i = idx; i < N; i += stride)
    {
        X[i * INCX] = ALPHA;
    }
}
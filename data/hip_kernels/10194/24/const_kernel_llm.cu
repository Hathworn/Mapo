#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop unrolling to optimize memory accesses
    int gridSize = gridDim.x * blockDim.x;
    for (; i < N; i += gridSize)
    {
        X[i * INCX] = ALPHA;
    }
}
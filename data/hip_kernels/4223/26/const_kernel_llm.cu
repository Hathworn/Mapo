#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplify grid index calculation
    int stride = gridDim.x * blockDim.x; // Compute stride for grid-wide iteration
    for (int i = idx; i < N; i += stride) // Use loop to handle large arrays beyond single block size
    {
        X[i * INCX] = ALPHA; // Assign ALPHA to each element at strided positions
    }
}
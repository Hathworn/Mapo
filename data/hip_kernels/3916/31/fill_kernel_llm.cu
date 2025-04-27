#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified 1D indexing
    int stride = gridDim.x * blockDim.x; // Calculate the stride for the loop
    for (int i = idx; i < N; i += stride) // Use loop unrolling for potential optimization
    {
        X[i*INCX] = ALPHA;
    }
}
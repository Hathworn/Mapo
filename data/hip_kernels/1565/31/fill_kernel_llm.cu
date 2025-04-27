#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Efficient index calculation
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) {
        // Memory coalescing by ensuring contiguous memory access
        X[i * INCX] = ALPHA;
    }
}
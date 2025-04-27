#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use blockIdx.x for better grid utilization
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) {
        // Optimize memory access pattern
        X[i * INCX] = ALPHA;
    }
}
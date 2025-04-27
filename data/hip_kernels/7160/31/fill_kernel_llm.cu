#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimized to use only blockIdx.x for linear block indexing

    // Check if within bounds
    if (i * INCX < N) { // Adjust bounds checking to account for INCX in index calculation
        X[i * INCX] = ALPHA;
    }
}
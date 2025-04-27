#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function
__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    int stride = gridDim.x * blockDim.x;            // Calculate stride for grid

    for (int idx = i; idx < N; idx += stride) {     // Loop over entire data with stride
        X[idx * INCX] = ALPHA;
    }
}
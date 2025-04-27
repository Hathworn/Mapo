#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    int stride = gridDim.x * blockDim.x; // Calculate stride for grid-stride loop
    for (; i < N; i += stride) { // Grid-stride loop for better utilization
        X[i * INCX] *= ALPHA;
    }
}
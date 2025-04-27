#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use a single calculate for grid index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Avoid repeated computation
    if (i < N) {
        int index = i * INCX;
        X[index] += ALPHA;
    }
}
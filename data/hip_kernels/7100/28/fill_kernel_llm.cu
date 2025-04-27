#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread ID, optimized for 1D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Using a stride loop to cover all elements
    for (; i < N; i += blockDim.x * gridDim.x) {
        X[i * INCX] = ALPHA;
    }
}
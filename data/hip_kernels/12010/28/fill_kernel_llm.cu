#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride to handle blocks larger than N
    for (int i = idx; i < N; i += gridDim.x * blockDim.x) {
        X[i * INCX] = ALPHA;
    }
}
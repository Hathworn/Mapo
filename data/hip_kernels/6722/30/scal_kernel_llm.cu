#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use strided access pattern
    for (int idx = i; idx < N; idx += gridDim.x * blockDim.x) {
        X[idx * INCX] *= ALPHA;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use strided access pattern for coalesced memory access
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x) 
    {
        X[idx * INCX] = ALPHA;
    }
}
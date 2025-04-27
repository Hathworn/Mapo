#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread ID using block and thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop to iterate over all elements processed by this kernel
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x)
    {
        X[idx * INCX] = ALPHA;
    }
}
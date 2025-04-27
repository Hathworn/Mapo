#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop over the grid with stride to cover all elements
    for (int i = idx; i < N; i += blockDim.x * gridDim.x) 
    {
        X[i*INCX] = ALPHA;
    }
}
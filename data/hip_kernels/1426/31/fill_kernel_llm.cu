#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop to handle more elements per thread
    for (; i < N; i += blockDim.x * gridDim.x)
    {
        X[i * INCX] = ALPHA;
    }
}
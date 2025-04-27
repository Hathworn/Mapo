#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a more efficient loop to process multiple elements using thread
    for(; i < N; i += blockDim.x * gridDim.x)
    {
        X[i * INCX] += ALPHA;
    }
}
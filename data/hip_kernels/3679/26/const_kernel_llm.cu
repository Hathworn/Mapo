#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop for better scalability
    for (int stride = i; stride < N; stride += blockDim.x * gridDim.x)
    {
        X[stride * INCX] = ALPHA;
    }
}
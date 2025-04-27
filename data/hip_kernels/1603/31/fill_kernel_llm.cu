#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Optimize thread index calculation
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Loop to cover array with a stride
    for (; i < N; i += stride)
    {
        X[i * INCX] = ALPHA;
    }
}
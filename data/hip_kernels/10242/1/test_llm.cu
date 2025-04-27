#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test(float *a, float *b, float *c, int N)
{
    // Use threadIdx and blockDim for parallel computation
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Only compute within the bounds of N
    if (idx < N)
    {
        c[idx] = a[idx] * b[idx];
    }
}
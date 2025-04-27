#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorMultGPU(float *a, float *b, float *c, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds before assignment to avoid out-of-bounds access
    if (i < n)
    {
        c[i] = a[i] * b[i];
    }
}
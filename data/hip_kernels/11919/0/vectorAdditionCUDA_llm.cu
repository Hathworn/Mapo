#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

__global__ void vectorAdditionCUDA(const float* a, const float* b, float* c, int n)
{
    int ii = blockIdx.x * blockDim.x + threadIdx.x;
    if (ii < n)
    {
        // Perform vector addition
        c[ii] = a[ii] + b[ii];
    }
}
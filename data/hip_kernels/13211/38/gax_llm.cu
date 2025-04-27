#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

// Kernel function with loop unrolling optimization
__global__ void gax(const int lengthC, const double *a, const double *b, double *c)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;

    // Process two elements per iteration if possible, for better memory coalescing
    if (i < lengthC)
    {
        c[i] = a[0] * b[i];
    }
    if (i + blockDim.x * gridDim.x < lengthC)
    {
        c[i + blockDim.x * gridDim.x] = a[0] * b[i + blockDim.x * gridDim.x];
    }
}
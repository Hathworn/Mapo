```c
#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

// Optimize kinklin kernel function
__global__ void kinklin(const int n, const double gamma, const double *a, double *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use grid-stride loop to ensure all elements are processed
    for (; i < n; i += blockDim.x * gridDim.x) 
    {
        b[i] = (a[i] > 0.0) ? a[i] : gamma * a[i];
    }
}
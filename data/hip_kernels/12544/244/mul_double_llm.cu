#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void mul_double(int n, double *a, double *b, double *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Loop over elements with a stride to utilize all available threads
    for (; i < n; i += stride)
    {
        sum[i] = a[i] * b[i];
    }
}
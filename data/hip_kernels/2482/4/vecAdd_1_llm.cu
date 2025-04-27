#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function for vector addition
__global__ void vecAdd_1(double *a, double *b, double *c, int n)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for loop

    for (int i = id; i < n; i += stride) // Loop over array elements with stride
    {
        c[i] = a[i] + b[i];
    }
}
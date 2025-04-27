#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void ax(const int lengthC, const double a, const double *b, double *c)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Calculate total stride
    // Use stride to process multiple elements per thread
    for (; i < lengthC; i += stride)
    {
        c[i] = a * b[i];
    }
}
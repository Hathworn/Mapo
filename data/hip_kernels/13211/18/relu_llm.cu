#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void relu(const int n, const double *a, double *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Use ternary operator for conditional assignment
        b[i] = (a[i] > 0.0) ? a[i] : 0.0;
    }
}
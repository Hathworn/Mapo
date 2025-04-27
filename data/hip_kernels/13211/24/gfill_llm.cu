#include "hip/hip_runtime.h"
#include "includes.h"
// B=diag(A)

extern "C"
{
}
__global__ void gfill(const int n, const double *a, double *c)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use conditional execution to reduce branching
    if (i < n)
    {
        c[i] = a[0];
    }
}
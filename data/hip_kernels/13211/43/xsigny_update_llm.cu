#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void xsigny_update(const int n, const double *a, double *b, double *c)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < n)
    {
        // Simplify conditional check using conditional operator
        c[i] += (b[i] > 0) ? a[i] : (b[i] < 0) ? -a[i] : 0;
    }
}
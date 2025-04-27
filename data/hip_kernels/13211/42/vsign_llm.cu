#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vsign(const int n, const double *a, double *b)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < n)
    {
        double ai = a[i]; // Cache a[i] to reduce memory access
        if (ai < 0)
        {
            b[i] = -1.0;
        }
        else if (ai > 0)
        {
            b[i] = 1.0;
        }
        else
        {
            b[i] = 0.0;
        }
    }
}
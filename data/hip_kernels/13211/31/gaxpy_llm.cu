#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
{
}

__global__ void gaxpy(const int lengthC, const double *a, const double *b, double *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by ensuring all memory accesses are coalesced and using shared memory if necessary
    if (i < lengthC)
    {
        c[i] = a[0] * b[i] + c[i];
    }
}
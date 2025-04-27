#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void vsquare(const double *a, double *c, int n)
{
    // Calculate global index
    int i = threadIdx.x + blockIdx.x * blockDim.x;

    // Check bounds to avoid accessing memory out of range
    if (i < n) {
        c[i] = a[i] * a[i];
    }
}
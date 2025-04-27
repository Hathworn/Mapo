#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vmultbangupdate(const int lengthA, const double alpha, const double *a, const double *b, double *c)
{
    // Calculate global thread index using a flat 1D grid mapping
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use strided loop to utilize parallelism more efficiently
    for (int idx = i; idx < lengthA; idx += blockDim.x * gridDim.x)
    {
        c[idx] += alpha * a[idx] * b[idx];
    }
}
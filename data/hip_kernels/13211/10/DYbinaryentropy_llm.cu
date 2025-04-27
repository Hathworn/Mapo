#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void DYbinaryentropy(const int lengthX, const double *x, const double *y, const double *t, double *z)
{
    // Use shared memory cache for 't[0]' for better performance
    __shared__ double shared_t;
    if (threadIdx.x == 0) {
        shared_t = t[0];
    }
    __syncthreads();

    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < lengthX)
    {
        // Optimize with registers: precompute expressions used multiple times
        double yi = y[i];
        double diff = y[i] - x[i];
        double denom = yi * (1.0 - yi);
        z[i] += shared_t * (diff / denom) / lengthX;
    }
}
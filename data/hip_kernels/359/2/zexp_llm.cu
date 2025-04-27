#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void zexp(float* Z, float* X, float* Y, unsigned int size)
{
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Unrolling for performance improvement
    for (unsigned long int i = idx; i < size; i += stride * 4) {
        Z[i] = X[i] * __expf(Y[i]);
        if (i + stride < size) Z[i + stride] = X[i + stride] * __expf(Y[i + stride]);
        if (i + 2 * stride < size) Z[i + 2 * stride] = X[i + 2 * stride] * __expf(Y[i + 2 * stride]);
        if (i + 3 * stride < size) Z[i + 3 * stride] = X[i + 3 * stride] * __expf(Y[i + 3 * stride]);
    }
}
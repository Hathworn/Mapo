#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void xexp(float* X, float* C, float* Y, float* Z, unsigned int size)
{
    // Calculate thread's global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride to cover all elements
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Unroll loop to improve performance
    for (unsigned long int i = idx; i < size; i += stride * 4) {
        if (i < size) X[i] = Z[i] * __expf(C[i] - Y[i]);
        if (i + stride < size) X[i + stride] = Z[i + stride] * __expf(C[i + stride] - Y[i + stride]);
        if (i + 2 * stride < size) X[i + 2 * stride] = Z[i + 2 * stride] * __expf(C[i + 2 * stride] - Y[i + 2 * stride]);
        if (i + 3 * stride < size) X[i + 3 * stride] = Z[i + 3 * stride] * __expf(C[i + 3 * stride] - Y[i + 3 * stride]);
    }
}
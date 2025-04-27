#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void xexp(float* X, float* C, float* Y, float* Z, unsigned int size)
{
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (idx < size) {
        X[idx] = Z[idx] * __expf(C[idx] - Y[idx]);
    }
}
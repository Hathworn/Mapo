#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void dual(float* err, float* Y, float* X, float* Z, unsigned int size)
{
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    float err_temp = 0.0;  // Use local variable to accumulate errors

    for (unsigned int i = idx; i < size; i += stride) {
        float temp = X[i] - Z[i];
        Y[i] += temp;
        err_temp += temp * temp;  // Accumulate errors locally
    }

    atomicAdd(&err[idx], err_temp);  // Atomic add to accumulate global errors
}
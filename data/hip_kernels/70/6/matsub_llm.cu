#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void matsub(float* X, float* Y, unsigned int size)
{
    // Calculate global thread ID
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop unrolling optimization
    int stride = blockDim.x * gridDim.x;
    for (unsigned int i = idx; i < size; i += stride) {
        X[i] -= Y[i];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void matsub(float* X, float* Y, unsigned int size) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        // Perform subtraction if thread index is within bounds
        X[idx] -= Y[idx];
    }
}
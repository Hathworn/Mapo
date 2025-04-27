#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void colNorm(float* X, float* v, unsigned int size, unsigned int n) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Iterate through elements with stride
    for (unsigned int i = idx; i < size; i += blockDim.x * gridDim.x) {
        // Compute column index
        unsigned int col = i % n;
        // Normalize element by corresponding column value
        X[i] /= v[col];
    }
}
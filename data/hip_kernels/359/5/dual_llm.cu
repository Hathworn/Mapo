#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void dual(float* err, float* Y, float* X, float* Z, unsigned int size) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    float local_err = 0.0f;

    // Loop with stride
    for (unsigned int i = idx; i < size; i += stride) {
        float temp = X[i] - Z[i]; // Compute difference
        Y[i] += temp; // Update Y array
        local_err += temp * temp; // Accumulate local error
    }

    // Atomic addition to ensure correct reduction
    atomicAdd(&err[0], local_err);
}
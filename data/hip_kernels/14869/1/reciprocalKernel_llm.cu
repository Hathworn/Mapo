#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reciprocalKernel(float *data, unsigned vectorSize) {
    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < vectorSize) {
        // Store the reciprocal in a register variable to reduce global memory access
        float reciprocal = 1.0f / data[idx];
        data[idx] = reciprocal;
    }
}
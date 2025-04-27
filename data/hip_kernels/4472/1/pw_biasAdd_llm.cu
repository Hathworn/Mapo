#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_biasAdd(float *y, float *bias, int n, int nBias) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        // Cache the bias value to reduce global memory access.
        float localBias = bias[i % nBias];
        y[i] += localBias;
    }
}
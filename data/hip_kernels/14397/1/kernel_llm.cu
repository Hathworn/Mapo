#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *x, int n)
{
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculate total stride once

    for (int i = tid; i < n; i += stride) {
        float value = pow(3.14159, i); // Calculate pow once
        x[i] = sqrt(value); // Store sqrt of value
    }
}
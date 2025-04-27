#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_kernel(const float a, const float* __restrict__ x, const float* __restrict__ y, float* __restrict__ result, unsigned int len) {
    // Calculate global thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform computation only for valid indices
    if (idx < len) {
        // Cache load for x and y to reduce global memory access times
        float x_val = x[idx];
        float y_val = y[idx];

        // Store the result back at the same index
        result[idx] = a * x_val + y_val;
    }
}
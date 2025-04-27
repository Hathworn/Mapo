#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float softplus_kernel(float x, float threshold = 20) {
    // Optimize: Use condition ternary operator
    return (x > threshold) ? x : (x < -threshold) ? expf(x) : logf(expf(x) + 1);
}

__device__ float tanh_activate_kernel(float x) {
    // Optimize: Simplify expression
    return (2 / (1 + expf(-2 * x)) - 1);
}

__global__ void mish_kernel(const float *input, float *output, int num_elem) {
    // Calculate index
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    // Check bounds
    if (idx >= num_elem) return;
    // Compute Mish activation
    float sp = softplus_kernel(input[idx]);
    output[idx] = input[idx] * tanh_activate_kernel(sp);
}
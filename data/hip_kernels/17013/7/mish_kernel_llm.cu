#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float softplus_kernel(float x, float threshold = 20) {
    if (x > threshold) return x;                // Simplified condition for large values
    else if (x < -threshold) return expf(x);    // Simplified condition for small values
    return logf(expf(x) + 1);
}

__device__ float tanh_activate_kernel(float x) {
    return (2 / (1 + expf(-2 * x)) - 1);        // Calculate tanh activation
}

__global__ void mish_kernel(const float *input, float *output, int num_elem) {
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    if (idx >= num_elem) return;                // Ensure idx is within bounds

    // Utilize both softplus and tanh kernel directly for mish computation
    output[idx] = input[idx] * tanh_activate_kernel(softplus_kernel(input[idx]));
}
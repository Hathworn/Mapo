#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelBackprop3b(float *delta_nabla_b, int b_off, float *zs) {
    int idx = b_off + threadIdx.x; // Use variable to reduce redundant computation
    float sigmoid = 1.0f / (1.0f + expf(-zs[threadIdx.x])); // Calculate sigmoid once
    float sigmoid_derivative = sigmoid * (1.0f - sigmoid); // Use intermediate result
    delta_nabla_b[idx] *= sigmoid_derivative; // Simplify computation
}
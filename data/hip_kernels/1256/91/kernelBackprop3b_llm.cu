#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelBackprop3b(float *delta_nabla_b, int b_off, float *zs) {
    // Cache index value to avoid redundant calculations
    int idx = b_off + threadIdx.x;
    float sigmoid = 1.0 / (1.0 + expf(-zs[threadIdx.x])); // Calculate sigmoid once
    delta_nabla_b[idx] *= sigmoid * (1.0 - sigmoid);
}
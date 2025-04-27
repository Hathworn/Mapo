#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCorrectPreds(float* mat, float* p, float* target, unsigned int len, float cutoff) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize: Ensure that threads exceeding array length do not execute
    if (idx < len) {
        // Perform computation directly without loop
        target[idx] = mat[idx] * (p[idx] >= cutoff) + (1 - mat[idx]) * (p[idx] < cutoff);
    }
}
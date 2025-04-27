#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize parallelization for better memory access
__global__ void kApplySoftThreshold(float* mat, float alpha, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {
        float f = mat[idx];
        target[idx] = f > 0 ? max(0.f, f - alpha) : min(0.f, f + alpha); // Use float literals
    }
}
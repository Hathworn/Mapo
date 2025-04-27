#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSign(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {
        target[idx] = copysignf(1.0f, mat[idx]);  // Simplified conditional and improved parallelism
    }
}
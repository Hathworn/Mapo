```cuda
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float sigmoid(float x) {
    return 1.0f / (1.0f + __expf(-x));
}

__global__ void kApplySigmoid(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) { // Ensure idx is within bounds
        target[idx] = sigmoid(mat[idx]);
    }
}
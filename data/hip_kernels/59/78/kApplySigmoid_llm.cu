#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float sigmoid(float x) {
    return 1.0f / (1.0f + __expf(-x));
}

__global__ void kApplySigmoid(float* __restrict__ mat, float* __restrict__ target, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Optimize by eliminating unnecessary variable
    if (idx < len) {
        target[idx] = sigmoid(mat[idx]);
    }
}
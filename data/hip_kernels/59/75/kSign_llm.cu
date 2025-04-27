#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSign(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use stride loop with improved handling of synchronization and memory coalescing
    for (unsigned int i = idx; i < len; i += numThreads) {
        float value = mat[i];
        target[i] = (value > 0.0f) - (value < 0.0f); // More concise determination of sign
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCrossEntropy(float* mat, float* p, float* target, unsigned int len, float tiny) {
    // Calculate the global index once instead of recalculating in each iteration
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll the loop for improved efficiency
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = -mat[i] * __logf(p[i] + tiny); // Use registers for improved performance
    }
}
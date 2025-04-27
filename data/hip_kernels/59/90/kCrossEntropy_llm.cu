#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCrossEntropy(float* mat, float* p, float* target, unsigned int len, float tiny) {
    // Cache frequently accessed values
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < len; i += stride) {
        // Perform computation and directly write to target
        float prob = p[i] + tiny;
        target[i] = -mat[i] * __logf(prob);
    }
}
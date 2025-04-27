#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCrossEntropy(float* mat, float* p, float* target, unsigned int len, float tiny) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use grid-stride loop for better performance
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = -mat[i] * __logf(p[i] + tiny);
    }
}
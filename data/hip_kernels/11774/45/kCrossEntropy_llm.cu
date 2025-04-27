#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCrossEntropy(float* mat, float* p, float* target, unsigned int len, float tiny) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < len; i += stride) {
        // Optimize by using native math function and avoiding redundant computation
        target[i] = -mat[i] * __logf(p[i] + tiny);
    }
}
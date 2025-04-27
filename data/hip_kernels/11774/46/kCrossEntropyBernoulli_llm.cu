#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kCrossEntropyBernoulli(float* mat, float* p, float* target, unsigned int len, float tiny) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop unrolling for better performance
    for (unsigned int i = idx; i < len; i += stride * 4) {
        if (i < len) {
            target[i] = -mat[i] * __logf(p[i] + tiny) - (1 - mat[i]) * __logf(1 - p[i] + tiny);
        }
        if (i + stride < len) {
            target[i + stride] = -mat[i + stride] * __logf(p[i + stride] + tiny) - (1 - mat[i + stride]) * __logf(1 - p[i + stride] + tiny);
        }
        if (i + 2 * stride < len) {
            target[i + 2 * stride] = -mat[i + 2 * stride] * __logf(p[i + 2 * stride] + tiny) - (1 - mat[i + 2 * stride]) * __logf(1 - p[i + 2 * stride] + tiny);
        }
        if (i + 3 * stride < len) {
            target[i + 3 * stride] = -mat[i + 3 * stride] * __logf(p[i + 3 * stride] + tiny) - (1 - mat[i + 3 * stride]) * __logf(1 - p[i + 3 * stride] + tiny);
        }
    }
}
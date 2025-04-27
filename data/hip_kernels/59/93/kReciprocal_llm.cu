#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kReciprocal(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    // Loop unrolling for better performance
    for (unsigned int i = idx; i + 4 <= len; i += 4 * stride) {
        target[i] = 1.0f / mat[i];
        if (i + stride < len) target[i + stride] = 1.0f / mat[i + stride];
        if (i + 2 * stride < len) target[i + 2 * stride] = 1.0f / mat[i + 2 * stride];
        if (i + 3 * stride < len) target[i + 3 * stride] = 1.0f / mat[i + 3 * stride];
    }
}
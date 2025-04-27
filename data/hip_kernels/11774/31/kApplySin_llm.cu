#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplySin(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop unrolling for performance optimization
    for (unsigned int i = idx; i < len; i += stride * 4) {
        target[i] = __sinf(mat[i]);
        if (i + stride < len) target[i + stride] = __sinf(mat[i + stride]);
        if (i + 2 * stride < len) target[i + 2 * stride] = __sinf(mat[i + 2 * stride]);
        if (i + 3 * stride < len) target[i + 3 * stride] = __sinf(mat[i + 3 * stride]);
    }
}
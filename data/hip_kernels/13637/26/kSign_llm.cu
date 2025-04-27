#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSign(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Using loop unrolling for better performance
    for (unsigned int i = idx; i < len; i += stride * 4) {
        if (i < len) target[i] = copysignf(1.0f, mat[i]);
        if (i + stride < len) target[i + stride] = copysignf(1.0f, mat[i + stride]);
        if (i + 2 * stride < len) target[i + 2 * stride] = copysignf(1.0f, mat[i + 2 * stride]);
        if (i + 3 * stride < len) target[i + 3 * stride] = copysignf(1.0f, mat[i + 3 * stride]);
    }
}
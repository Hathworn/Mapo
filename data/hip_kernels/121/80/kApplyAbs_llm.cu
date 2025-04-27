#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyAbs(float* mat, float* target, unsigned int len) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;
    // Loop unrolling for better performance
    for (unsigned int i = idx; i < len; i += stride * 4) { 
        if (i < len) target[i] = fabsf(mat[i]);
        if (i + stride < len) target[i + stride] = fabsf(mat[i + stride]);
        if (i + 2 * stride < len) target[i + 2 * stride] = fabsf(mat[i + 2 * stride]);
        if (i + 3 * stride < len) target[i + 3 * stride] = fabsf(mat[i + 3 * stride]);
    }
}
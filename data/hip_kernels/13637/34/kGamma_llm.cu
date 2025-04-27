#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kGamma(float* mat, float* target, unsigned int len) {
    // Optimize: pre-calculate grid stride outside loop
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = tgammaf(mat[i]);
    }
}
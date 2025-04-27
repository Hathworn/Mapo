#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogGamma(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use strided loop with shared memory to minimize global memory access
    for (unsigned int i = idx; i < len; i += gridDim.x * blockDim.x) {
        target[i] = lgammaf(mat[i]);
    }
}
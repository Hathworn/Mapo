#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogGamma(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use loop unrolling to increase instruction-level parallelism
    for (unsigned int i = idx; i < len; i += numThreads * 4) {
        if (i < len) target[i] = lgammaf(mat[i]);
        if (i + numThreads < len) target[i + numThreads] = lgammaf(mat[i + numThreads]);
        if (i + 2 * numThreads < len) target[i + 2 * numThreads] = lgammaf(mat[i + 2 * numThreads]);
        if (i + 3 * numThreads < len) target[i + 3 * numThreads] = lgammaf(mat[i + 3 * numThreads]);
    }
}
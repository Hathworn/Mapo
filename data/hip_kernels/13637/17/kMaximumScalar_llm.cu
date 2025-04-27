#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMaximumScalar(float* mat, float val, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Unroll the loop to increase instruction throughput
    for (unsigned int i = idx; i < len; i += numThreads * 4) {
        if (i < len) target[i] = fmaxf(mat[i], val);
        if (i + numThreads < len) target[i + numThreads] = fmaxf(mat[i + numThreads], val);
        if (i + 2 * numThreads < len) target[i + 2 * numThreads] = fmaxf(mat[i + 2 * numThreads], val);
        if (i + 3 * numThreads < len) target[i + 3 * numThreads] = fmaxf(mat[i + 3 * numThreads], val);
    }
}
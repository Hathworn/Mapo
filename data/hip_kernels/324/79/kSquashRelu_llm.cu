#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSquashRelu(float* mat, float* target, unsigned int len, float lambda) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Loop unrolling to improve warp execution efficiency
    for (unsigned int i = idx; i < len; i += numThreads * 4) {
        if (i < len) target[i] = 2 / (1 + __expf(-lambda * mat[i])) - 1;
        if (i + numThreads < len) target[i + numThreads] = 2 / (1 + __expf(-lambda * mat[i + numThreads])) - 1;
        if (i + 2 * numThreads < len) target[i + 2 * numThreads] = 2 / (1 + __expf(-lambda * mat[i + 2 * numThreads])) - 1;
        if (i + 3 * numThreads < len) target[i + 3 * numThreads] = 2 / (1 + __expf(-lambda * mat[i + 3 * numThreads])) - 1;
    }
}
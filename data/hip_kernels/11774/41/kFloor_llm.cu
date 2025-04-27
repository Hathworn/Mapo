#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kFloor(float* __restrict__ mat, float* __restrict__ target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Unrolling loop to improve performance
    for (unsigned int i = idx; i < len; i += numThreads * 4) {
        if (i < len) target[i] = floorf(mat[i]);
        if (i + numThreads < len) target[i + numThreads] = floorf(mat[i + numThreads]);
        if (i + 2 * numThreads < len) target[i + 2 * numThreads] = floorf(mat[i + 2 * numThreads]);
        if (i + 3 * numThreads < len) target[i + 3 * numThreads] = floorf(mat[i + 3 * numThreads]);
    }
}
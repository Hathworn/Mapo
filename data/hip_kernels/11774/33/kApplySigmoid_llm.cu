#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplySigmoid(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use warp divergence reduction by processing multiple elements per thread
    #pragma unroll
    for (unsigned int i = idx; i < len; i += numThreads) {
        target[i] = 1 / (1 + __expf(-mat[i]));
    }
}
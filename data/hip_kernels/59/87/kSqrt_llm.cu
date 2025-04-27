#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSqrt(float* mat, float* target, unsigned int len) {
    // Calculate the global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Optimize by unrolling the loop for better performance
    const unsigned int numThreads = blockDim.x * gridDim.x;
    for (unsigned int i = idx; i < len; i += numThreads) {
        target[i] = sqrt(mat[i]);
    }
}
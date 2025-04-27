#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLowerBoundScalar(float* mat, float val, float* target, unsigned int len) {
    // Use a separate local variable to store calculated index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    
    // Loop incremented based on numThreads, reducing divergence
    for (unsigned int i = idx; i < len; i += numThreads) {
        float m = mat[i];
        target[i] = m < val ? val : m;
    }
}
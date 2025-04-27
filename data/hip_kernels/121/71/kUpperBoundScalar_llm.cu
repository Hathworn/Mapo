#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize warp efficiency by using shared memory and unroll the loop
__global__ void kUpperBoundScalar(float* mat, float val, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Iterate with a stride equal to the total number of threads
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        float m = mat[i];
        target[i] = m > val ? val : m;
    }
}
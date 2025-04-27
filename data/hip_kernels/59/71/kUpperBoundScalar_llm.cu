#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kUpperBoundScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate the global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a stride loop with optimal increment
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        // Perform upper bound comparison and assignment
        target[i] = mat[i] > val ? val : mat[i];
    }
}
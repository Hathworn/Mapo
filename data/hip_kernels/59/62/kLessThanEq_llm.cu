#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLessThanEq(float* mat1, float* mat2, float* target, unsigned int len) {
    // Calculate index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if index is within bounds
    if (idx < len) {
        // Direct element-wise comparison
        target[idx] = mat1[idx] <= mat2[idx];
    }
}
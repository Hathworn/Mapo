#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLessThanEq(float* mat1, float* mat2, float* target, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (idx < len) {
        target[idx] = mat1[idx] <= mat2[idx];
    }
}
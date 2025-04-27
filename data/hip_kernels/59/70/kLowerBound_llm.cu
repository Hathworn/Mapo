#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLowerBound(float* mat1, float* mat2, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {  // Optimize with boundary check
        target[idx] = fmaxf(mat1[idx], mat2[idx]);  // Use fmaxf for performance
    }
}
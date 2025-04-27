#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void forwardDifferenceAdjointKernel(const int len, const float* source, float* target) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 1;
    // Unroll loop for performance
    while (idx < len - 1) {
        target[idx] = -source[idx] + source[idx - 1];
        idx += blockDim.x * gridDim.x;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLog(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) { // Process only if index is within bounds
        target[idx] = __logf(mat[idx]);
    }
}
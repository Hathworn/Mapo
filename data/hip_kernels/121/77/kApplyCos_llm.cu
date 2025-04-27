#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyCos(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Simplified loop to handle each element within thread's range.
    if (idx < len) target[idx] = __cosf(mat[idx]);
}
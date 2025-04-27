#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kReciprocal(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (idx < len) {
        target[idx] = 1.f / mat[idx];
    }
}
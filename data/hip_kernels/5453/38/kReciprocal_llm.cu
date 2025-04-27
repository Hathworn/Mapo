#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kReciprocal(float* mat, float* target, unsigned int len) {
    // Calculate linear thread index across the grid
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use each thread to handle a single element if within length
    if (idx < len) {
        target[idx] = 1.f / mat[idx];
    }
}
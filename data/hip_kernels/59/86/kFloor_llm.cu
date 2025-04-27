#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kFloor(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride to ensure all elements are processed and avoid diverging threads
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = floor(mat[i]);  // Perform floor operation
    }
}
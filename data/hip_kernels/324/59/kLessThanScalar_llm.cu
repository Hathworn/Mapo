#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLessThanScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds and operate directly on each index
    if (idx < len) {
        target[idx] = mat[idx] < val;
    }
}
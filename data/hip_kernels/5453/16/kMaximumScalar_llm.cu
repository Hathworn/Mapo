#include "hip/hip_runtime.h"
#include "includes.h"

// Improved maximum scalar kernel function
__global__ void kMaximumScalar(float* mat, float val, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < len) {  // Ensure thread does not exceed array bounds
        target[idx] = fmaxf(mat[idx], val);
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSign(float* mat, float* target, unsigned int len) {
// Calculate global index
const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

// Ensure thread index is within bounds
if (idx < len) {
    target[idx] = mat[idx] ? copysignf(1.f, mat[idx]) : 0.f;
}
}
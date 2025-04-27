#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kGreaterThanEqScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate linear index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is within bounds
    if (idx < len) {
        target[idx] = mat[idx] >= val;
    }
}
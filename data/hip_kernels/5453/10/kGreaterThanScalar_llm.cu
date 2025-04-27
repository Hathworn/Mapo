#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kGreaterThanScalar(float* mat, float val, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we don't access out-of-bounds memory
    if (idx < len) {
        target[idx] = mat[idx] > val;
    }
}
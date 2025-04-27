#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLessThanScalar(float* mat, float val, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < len) { // Ensure threads do not access out-of-bounds memory
        target[idx] = mat[idx] < val;
    }
}
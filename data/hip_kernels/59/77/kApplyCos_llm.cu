#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyCos(float* mat, float* target, unsigned int len) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check idx before processing to avoid out of bounds access
    if (idx < len) {
        target[idx] = __cosf(mat[idx]);
    }
}
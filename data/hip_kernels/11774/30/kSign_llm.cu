#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSign(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Unroll the loop to improve performance.
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = (mat[i] > 0) - (mat[i] < 0); // Optimize copysignf with a faster operation
    }
}
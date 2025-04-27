#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kPow(float* mat, float pow, float* target, unsigned int len) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll the loop to reduce loop overhead
    for (; idx + 3 < len; idx += blockDim.x * gridDim.x * 4) {
        target[idx] = powf(mat[idx], pow);
        target[idx + 1] = powf(mat[idx + 1], pow);
        target[idx + 2] = powf(mat[idx + 2], pow);
        target[idx + 3] = powf(mat[idx + 3], pow);
    }

    // Handle remaining elements
    for (; idx < len; idx += blockDim.x * gridDim.x) {
        target[idx] = powf(mat[idx], pow);
    }
}
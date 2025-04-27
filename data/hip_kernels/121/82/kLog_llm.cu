#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLog(float* mat, float* target, unsigned int len, float tiny) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Use loop unrolling for optimization
    for (; idx + 3 < len; idx += stride * 4) {
        target[idx] = __logf(mat[idx] + tiny);
        target[idx + 1] = __logf(mat[idx + 1] + tiny);
        target[idx + 2] = __logf(mat[idx + 2] + tiny);
        target[idx + 3] = __logf(mat[idx + 3] + tiny);
    }
    for (; idx < len; idx += stride) {
        target[idx] = __logf(mat[idx] + tiny);
    }
}
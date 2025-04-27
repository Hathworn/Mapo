#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kPow(float* mat, float pow, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x; // Use stride for clarity

    // Unroll loop for performance improvement
    for (unsigned int i = idx; i < len; i += stride * 4) {
        if (i < len) target[i] = powf(mat[i], pow);
        if (i + stride < len) target[i + stride] = powf(mat[i + stride], pow);
        if (i + 2 * stride < len) target[i + 2 * stride] = powf(mat[i + 2 * stride], pow);
        if (i + 3 * stride < len) target[i + 3 * stride] = powf(mat[i + 3 * stride], pow);
    }
}
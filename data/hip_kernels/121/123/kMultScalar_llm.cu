#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultScalar(float* mat, float alpha, float* dest, unsigned int len, float scale_targets) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x; // Use stride for better readability

    // Unroll the loop for potential performance improvement
    if (scale_targets == 0) {
        for (unsigned int i = idx; i < len; i += stride) {
            dest[i] = alpha * mat[i];
        }
    } else {
        for (unsigned int i = idx; i < len; i += stride) {
            dest[i] = scale_targets * dest[i] + alpha * mat[i];
        }
    }
}
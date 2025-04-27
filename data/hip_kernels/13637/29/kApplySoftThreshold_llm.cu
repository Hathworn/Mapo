```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplySoftThreshold(float* mat, float alpha, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Optimize to use threadIdx.x for better memory coalescing
    for (unsigned int i = idx; i < len; i += stride) {
        float f = mat[i];
        target[i] = (f > alpha) ? (f - alpha) : ((f < -alpha) ? (f + alpha) : 0.0f);
    }
}
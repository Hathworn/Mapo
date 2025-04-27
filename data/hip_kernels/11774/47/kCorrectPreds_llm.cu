#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kCorrectPreds(float* mat, float* p, float* target, unsigned int len, float cutoff) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use coalesced memory reads and stride step
    for (unsigned int i = idx; i < len; i += stride) {
        float matVal = mat[i];
        float pVal = p[i];
        target[i] = matVal * (pVal >= cutoff) + (1 - matVal) * (pVal < cutoff);
    }
}
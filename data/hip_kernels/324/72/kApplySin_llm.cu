#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplySin(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use coalesced memory access by ensuring threads access consecutive memory addresses
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = __sinf(mat[i]);
    }
}
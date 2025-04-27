#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyAbs(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Loop unrolling optimization
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = fabsf(mat[i]);
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyCos(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Optimize loop by stride processing each thread's lane efficiently
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = __cosf(mat[i]);
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kEquals(float* mat1, float* mat2, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Optimized loop with stride access pattern
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = (mat1[i] == mat2[i]) ? 1.0f : 0.0f;  // Ensure target[i] is float
    }
}
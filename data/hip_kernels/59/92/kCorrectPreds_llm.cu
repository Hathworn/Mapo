#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCorrectPreds(float* mat, float* p, float* target, unsigned int len, float cutoff) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x; 
    const unsigned int stride = blockDim.x * gridDim.x; // Total stride for all threads

    // Efficient loop with stride for memory access coalescing
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = mat[i] * (p[i] >= cutoff) + (1 - mat[i]) * (p[i] < cutoff);
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCrossEntropyBernoulli(float* mat, float* p, float* target, unsigned int len, float tiny) {
    // Calculate unique global thread ID
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure each thread processes multiple elements for optimal occupancy and performance
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        float mat_val = mat[i];
        float p_val = p[i];
        target[i] = -mat_val * __logf(p_val + tiny) - (1.0f - mat_val) * __logf(1.0f - p_val + tiny);
    }
}
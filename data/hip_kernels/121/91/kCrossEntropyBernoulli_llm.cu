#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kCrossEntropyBernoulli(float* mat, float* p, float* target, unsigned int len, float tiny) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop unrolling for better memory access efficiency
    for (unsigned int i = idx; i < len; i += stride) {
        float mat_val = mat[i];
        float p_val = p[i];
        
        // Store logarithm results to avoid redundant calculations
        float log_p = __logf(p_val + tiny);
        float log_one_minus_p = __logf(1 - p_val + tiny);

        target[i] = -mat_val * log_p - (1 - mat_val) * log_one_minus_p;
    }
}
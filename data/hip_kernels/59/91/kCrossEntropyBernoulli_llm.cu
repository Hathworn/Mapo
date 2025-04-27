#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCrossEntropyBernoulli(float* mat, float* p, float* target, unsigned int len, float tiny) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Vectorize accesses by using the stride pattern
    for (unsigned int i = idx; i < len; i += stride) {
        float mat_val = mat[i];
        float p_val = p[i];
        
        // Reduce redundant memory accesses and multiplications
        float log_p = __logf(p_val + tiny);
        float log_one_minus_p = __logf(1 - p_val + tiny);
        
        // Replace decimal multiplications with pre-computed values
        target[i] = -mat_val * log_p - (1.0f - mat_val) * log_one_minus_p;
    }
}
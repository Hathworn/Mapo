#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyTanh(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Utilize more efficient memory access pattern
    for (unsigned int i = idx; i < len; i += stride) {
        float mat_i = mat[i];
        // Use fast mathematic intrinsic for exp
        float exp2x = __expf(2.0f * mat_i);
        target[i] = 1.0f - 2.0f / (exp2x + 1.0f);
    }
}
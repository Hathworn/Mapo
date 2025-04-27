#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultScalar(float* mat, float alpha, float* dest, unsigned int len, float scale_targets) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Unifying loops for better readability and potential performance improvements
    for (unsigned int i = idx; i < len; i += stride) {
        dest[i] = (scale_targets == 0 ? 0 : scale_targets * dest[i]) + alpha * mat[i];
    }
}
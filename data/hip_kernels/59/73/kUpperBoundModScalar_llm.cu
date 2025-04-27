#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kUpperBoundModScalar(float* mat, float val, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Optimize by simplifying loop stride calculation
    for (unsigned int i = idx; i < len; i += stride) {
        float m = mat[i];
        target[i] = m > val ? val : (m < -val ? -val : m);
    }
}
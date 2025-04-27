#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMaximum(float* mat1, float* mat2, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x; // Improve variable naming

    // Use __restrict__ to suggest that there is no aliasing
    float* __restrict__ m1 = mat1;
    float* __restrict__ m2 = mat2;
    float* __restrict__ tgt = target;
    
    for (unsigned int i = idx; i < len; i += stride) {
        tgt[i] = fmaxf(m1[i], m2[i]); // Use restricted pointers
    }
}
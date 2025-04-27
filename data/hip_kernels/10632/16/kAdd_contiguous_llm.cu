#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Use for-loop with stride for better memory access pattern
    for (unsigned int i = idx; i < numEls; i += stride) {
        dest[i] = a[i] + b[i];
    }
}
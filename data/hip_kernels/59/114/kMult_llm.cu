#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMult(float* a, float* b, float* dest, unsigned int numEls, float scale_targets) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    
    for (unsigned int i = idx; i < numEls; i += numThreads) {
        // Use ternary operator to simplify logic
        dest[i] = (scale_targets == 0) ? (a[i] * b[i]) : (scale_targets * dest[i] + a[i] * b[i]);
    }
}
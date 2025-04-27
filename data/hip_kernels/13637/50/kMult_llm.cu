#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMult(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate unique thread ID and stride for processing
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Optimize by using a stride loop for better memory coalescing
    for (unsigned int i = idx; i < numEls; i += stride) {
        dest[i] = a[i] * b[i];
    }
}
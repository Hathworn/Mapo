#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread does not access out-of-bounds elements
    if (idx < numEls) {
        dest[idx] = a[idx] + b[idx];
    }
}
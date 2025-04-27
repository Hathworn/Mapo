#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogisticDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate global thread ID
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we don't go out of bounds
    if (idx < numEls) {
        dest[idx] = a[idx] * b[idx] * (1.0 - b[idx]);
    }
}
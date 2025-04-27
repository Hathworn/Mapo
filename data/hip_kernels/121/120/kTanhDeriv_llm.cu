#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTanhDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
   
    // Ensure the thread operates only within bounds
    if (idx < numEls) {
        dest[idx] = a[idx] * (1.0 + b[idx]) * (1.0 - b[idx]);
    }
}
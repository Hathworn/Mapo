#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTanhDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < numEls) { // Ensure each thread only processes valid elements
        dest[idx] = a[idx] * (1.0 + b[idx]) * (1.0 - b[idx]);
    }
}
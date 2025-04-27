#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogisticDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < numEls) { // Check to ensure idx is within bounds
        float b_val = b[idx]; // Cache frequently accessed value
        dest[idx] = a[idx] * b_val * (1.0f - b_val);
    }
}
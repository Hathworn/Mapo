#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogisticDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < numEls) { // Ensure processing only within bounds
        dest[idx] = a[idx] * b[idx] * (1.0 - b[idx]); // Compute result for current index
    }
}
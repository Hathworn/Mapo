#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMult(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Check bounds to avoid unnecessary calculations
    if (idx < numEls) {
        dest[idx] = a[idx] * b[idx];
    }
}
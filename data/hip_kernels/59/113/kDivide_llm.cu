#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDivide(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Bounds check; ensure index is within array limits
    if (idx < numEls) {
        dest[idx] = a[idx] / b[idx];
    }
}
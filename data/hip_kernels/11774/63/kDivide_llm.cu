#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivide(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < numEls) { // Optimize: check bounds before accessing memory
        dest[idx] = a[idx] / b[idx];
    }
}
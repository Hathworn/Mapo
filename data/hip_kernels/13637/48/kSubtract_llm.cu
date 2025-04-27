#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSubtract(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate unique thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds before computation
    if (idx < numEls) {
        dest[idx] = a[idx] - b[idx];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a more efficient loop by leveraging single-thread execution per element
    if (idx < numEls) {
        dest[idx] = a[idx] + b[idx];
    }
}
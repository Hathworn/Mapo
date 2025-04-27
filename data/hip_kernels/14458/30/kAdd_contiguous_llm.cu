#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if idx is within the bounds to improve performance
    if (idx < numEls) {
        dest[idx] = a[idx] + b[idx];
    }
}
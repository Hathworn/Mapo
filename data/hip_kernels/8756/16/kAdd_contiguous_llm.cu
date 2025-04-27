#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate thread's absolute index in the data
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure the thread index is within the bounds
    if (idx < numEls) {
        dest[idx] = a[idx] + b[idx];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Improved: Calculate the index and ensure it doesn't exceed numEls
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < numEls) {
        dest[idx] = a[idx] + b[idx];
    }
}
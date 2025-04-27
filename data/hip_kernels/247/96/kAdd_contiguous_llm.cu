#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Unroll the loop for better performance
    unsigned int i = idx;
    while (i < numEls) {
        dest[i] = a[i] + b[i];
        i += stride;
    }
}
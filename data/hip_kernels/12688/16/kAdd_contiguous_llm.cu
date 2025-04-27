#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate the thread's unique index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop for better memory access pattern
    for (unsigned int stride = idx; stride < numEls; stride += blockDim.x * gridDim.x) {
        dest[stride] = a[stride] + b[stride];
    }
}
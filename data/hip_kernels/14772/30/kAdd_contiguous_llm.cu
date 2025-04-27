#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x; // Compute stride for better readability

    // Unrolling loop to improve performance
    for (unsigned int i = idx; i < numEls; i += stride * 4) {
        if (i < numEls) dest[i] = a[i] + b[i];
        if (i + stride < numEls) dest[i + stride] = a[i + stride] + b[i + stride];
        if (i + 2 * stride < numEls) dest[i + 2 * stride] = a[i + 2 * stride] + b[i + 2 * stride];
        if (i + 3 * stride < numEls) dest[i + 3 * stride] = a[i + 3 * stride] + b[i + 3 * stride];
    }
}
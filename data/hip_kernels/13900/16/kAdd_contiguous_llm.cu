#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Use shared memory to reduce global memory accesses (not strongly beneficial here)
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Unrolling loop to enhance performance
    for (unsigned int i = idx; i < numEls; i += numThreads * 4) {
        if (i < numEls) dest[i] = a[i] + b[i];
        if (i + numThreads < numEls) dest[i + numThreads] = a[i + numThreads] + b[i + numThreads];
        if (i + numThreads * 2 < numEls) dest[i + numThreads * 2] = a[i + numThreads * 2] + b[i + numThreads * 2];
        if (i + numThreads * 3 < numEls) dest[i + numThreads * 3] = a[i + numThreads * 3] + b[i + numThreads * 3];
    }
}
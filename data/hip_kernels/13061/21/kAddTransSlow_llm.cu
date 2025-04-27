#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline int getTransArrayIndex(unsigned int width, unsigned int height, unsigned int i) {
    return height * (i % width) + i / width;
}

__global__ void kAddTransOptimized(float* a, float* b, float* dest, unsigned int width, unsigned int height, unsigned int numEls, float scaleA, float scaleB) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Optimize memory coalescing by accessing data sequentially
    for (unsigned int i = idx; i < numEls; i += numThreads) {
        unsigned int transIndex = getTransArrayIndex(width, height, i);
        float bValue = (transIndex < numEls) ? b[transIndex] : 0.0f; // Prevent out-of-bounds in case
        dest[i] = scaleA * a[i] + scaleB * bValue;
    }
}
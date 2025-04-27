#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop with stride equal to total number of threads
    for (unsigned int i = idx; i < numEls; i += blockDim.x * gridDim.x) {
        // Perform element-wise addition
        dest[i] = a[i] + b[i];
    }
}
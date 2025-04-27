#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSquaredDiff(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficiently iterate over elements by stride based on all threads
    if (idx < numEls) {
        dest[idx] = (a[idx] - b[idx]) * (a[idx] - b[idx]);
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSquaredDiff(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < numEls) { // Only compute if idx is within bounds
        dest[idx] = (a[idx] - b[idx]) * (a[idx] - b[idx]);
    }
}
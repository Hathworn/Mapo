#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMult(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use grid-stride loop to ensure all elements are processed
    for (unsigned int i = idx; i < numEls; i += blockDim.x * gridDim.x) {
        dest[i] = a[i] * b[i]; // Perform element-wise multiplication
    }
}
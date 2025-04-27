#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kReciprocal(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Improve memory coalescing by ensuring continuous access pattern
    for (unsigned int i = idx; i < numElements; i += blockDim.x * gridDim.x) {
        float data = gData[i]; // Load data into register
        target[i] = 1.0f / data; // Perform reciprocal and store to global memory
    }
}
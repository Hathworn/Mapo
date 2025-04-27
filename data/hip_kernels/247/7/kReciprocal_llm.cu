#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kReciprocal(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread processes valid indices only.
    if (idx < numElements) {
        target[idx] = 1 / gData[idx];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSubtractFromScalar(float* gData, float scalar, float* target, unsigned int numElements) {
    // Calculate global thread ID
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process threads within bounds
    if (idx < numElements) {
        target[idx] = scalar - gData[idx];
    }
}
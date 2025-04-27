#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSmallerThanScalar(float* gData, float scalar, float* target, unsigned int numElements) {
    // Calculate index considering the whole grid
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure work is only done within bounds
    if (idx < numElements) {
        target[idx] = gData[idx] < scalar;
    }
}
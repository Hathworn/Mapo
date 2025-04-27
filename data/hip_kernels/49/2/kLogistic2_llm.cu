#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogistic2(float* gData, float* target, unsigned int numElements) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (idx < numElements) {
        // Perform computation directly
        target[idx] = 1 / (1 + expf(-gData[idx]));
    }
}
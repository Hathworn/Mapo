#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSquare(float* gData, float* target, unsigned int numElements) {
    // Calculate initial global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stepSize = blockDim.x * gridDim.x; // Calculate step size only once

    for (unsigned int i = idx; i < numElements; i += stepSize) {
        target[i] = gData[i] * gData[i]; // Perform element-wise squaring
    }
}
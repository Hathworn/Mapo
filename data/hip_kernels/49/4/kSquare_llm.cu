```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSquare(float* gData, float* target, unsigned int numElements) {
    // Calculate the global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride to ensure all elements are processed efficiently
    const unsigned int gridSize = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < numElements; i += gridSize) {
        target[i] = gData[i] * gData[i];
    }
}
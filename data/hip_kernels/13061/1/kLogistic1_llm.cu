#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogistic1(float* gData, float* target, unsigned int numElements) {
    // Efficient index calculation using grid-stride loop
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int gridSize = blockDim.x * gridDim.x;

    for (; idx < numElements; idx += gridSize) {
        target[idx] = (1 + tanhf(gData[idx] / 2)) / 2;
    }
}
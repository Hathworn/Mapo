#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kReciprocal(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < numElements) {
        target[idx] = 1.0f / gData[idx];  // Use float division for better performance
    }
}
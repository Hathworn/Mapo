#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSign(float* gData, float* target, unsigned int numElements) {
    // Calculate global index once outside the loop
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use stride in loop condition
    for (unsigned int i = idx; i < numElements; i += stride) {
        target[i] = (gData[i] > 0) - (gData[i] < 0);
    }
}
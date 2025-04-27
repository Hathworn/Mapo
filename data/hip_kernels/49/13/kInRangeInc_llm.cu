#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kInRangeInc(float* gData, float lower, float upper, float* target, unsigned int numElements) {
    // Calculate unique thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop with controlled stride
    for (unsigned int i = idx; i < numElements; i += stride) {
        // Direct assignment with conditional expression
        target[i] = (gData[i] >= lower && gData[i] <= upper) ? 1.0f : 0.0f;
    }
}
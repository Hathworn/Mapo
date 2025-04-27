#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kInRangeInc(float* gData, float lower, float upper, float* target, unsigned int numElements) {
    // Use a local variable to reduce global memory access
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure idx is within numElements and use simpler loop unrolling to access memory less frequently
    if (idx < numElements) {
        for (unsigned int i = idx; i < numElements; i += blockDim.x * gridDim.x) {
            // Use local variables to reduce register pressure
            float value = gData[i];
            target[i] = (value >= lower) && (value <= upper);
        }
    }
}
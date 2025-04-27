#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kInRangeExc(float* gData, float lower, float upper, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride-based loop for better memory coalescing and fewer launch overheads
    for (unsigned int i = idx; i < numElements; i += blockDim.x * gridDim.x) {
        target[i] = (gData[i] > lower) && (gData[i] < upper);
    }
}
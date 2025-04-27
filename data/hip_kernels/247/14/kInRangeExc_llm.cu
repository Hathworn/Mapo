#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kInRangeExc(float* gData, float lower, float upper, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Process elements with a stride loop for better balance
    for (unsigned int i = idx; i < numElements; i += stride) {
        target[i] = (gData[i] > lower) && (gData[i] < upper);
    }
}
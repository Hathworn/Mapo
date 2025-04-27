#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLog(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;  // Pre-calculate stride

    for (unsigned int i = idx; i < numElements; i += stride) {
        target[i] = __logf(gData[i]);  // Use cached stride value
    }
}
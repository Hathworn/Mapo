#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kZero(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride for better coalescing and efficiency
    const unsigned int stride = blockDim.x * gridDim.x; 

    for (unsigned int i = idx; i < numElements; i += stride) {
        target[i] = 0;
    }
}
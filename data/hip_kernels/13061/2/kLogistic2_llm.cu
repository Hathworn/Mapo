#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogistic2(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Cache grid and block dimension to minimize register usage inside loop
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < numElements; i += stride) {
        // Reduce function calls by storing result in a variable
        float exp_val = expf(-gData[i]);
        target[i] = 1 / (1 + exp_val);
    }
}
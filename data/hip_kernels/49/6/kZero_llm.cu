#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kZero(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop for better performance and reduce loop overhead
    for (unsigned int i = idx; i < numElements; i += blockDim.x * gridDim.x * 2) {
        target[i] = 0;
        if (i + blockDim.x * gridDim.x < numElements) {
            target[i + blockDim.x * gridDim.x] = 0;
        }
    }
}
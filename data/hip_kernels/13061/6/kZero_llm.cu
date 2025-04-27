#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kZero(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a simple stride loop for efficient memory access
    if (idx < numElements) {
        for (unsigned int i = idx; i < numElements; i += blockDim.x * gridDim.x) {
            target[i] = 0;
        }
    }
}
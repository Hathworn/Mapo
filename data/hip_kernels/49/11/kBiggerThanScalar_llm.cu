#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kBiggerThanScalar(float* gData, float scalar, float* target, unsigned int numElements) {
    // Calculate unique global thread ID
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure each thread operates on its own index and processes remaining elements in a stride
    for (unsigned int i = idx; i < numElements; i += blockDim.x * gridDim.x) {
        target[i] = gData[i] > scalar;
    }
}
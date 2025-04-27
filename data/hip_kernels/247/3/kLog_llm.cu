#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLog(float* gData, float* target, unsigned int numElements) {
    // Calculate global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process all elements in stride of total threads
    for (unsigned int i = idx; i < numElements; i += blockDim.x * gridDim.x) {
        target[i] = logf(gData[i]); // Use logf for vector processing
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBiggerThanScalar(float* gData, float scalar, float* target, unsigned int numElements) {
    // Calculate the global index for the thread
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (idx < numElements) {
        target[idx] = gData[idx] > scalar;
    }
}
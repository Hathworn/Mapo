#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for comparing elements with a scalar.
__global__ void kSmallerThanScalar(float* gData, float scalar, float* target, unsigned int numElements) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop for better occupancy
    for (unsigned int i = idx; i < numElements; i += blockDim.x * gridDim.x) {
        target[i] = gData[i] < scalar;
    }
}
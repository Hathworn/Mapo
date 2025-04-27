#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCopy(float* srcStart, float* destStart, unsigned int copyWidth, unsigned int jumpWidth, unsigned int numElements) {
    // Calculate global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure global index is within bounds
    if (idx < numElements) {
        // Precompute row and column
        unsigned int row = idx / copyWidth;
        unsigned int col = idx % copyWidth;
        unsigned int srcIndex = row * jumpWidth + col;
        
        // Perform copy
        destStart[srcIndex] = srcStart[srcIndex];
    }
}
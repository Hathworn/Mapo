#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCopy(float* srcStart, float* destStart, const int copyWidth, const int srcJumpWidth, const int destJumpWidth, const int numElements) {
    // Calculate thread's linear index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x; 

    // Use stride loop to access multiple elements
    for (int i = idx; i < numElements; i += blockDim.x * gridDim.x) {
        int row = i / copyWidth;
        int col = i % copyWidth;
        
        // Copy from source to destination using precomputed row and col
        destStart[row * destJumpWidth + col] = srcStart[row * srcJumpWidth + col];
    }
}
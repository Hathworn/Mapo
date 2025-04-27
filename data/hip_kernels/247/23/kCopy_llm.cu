#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCopy(float* srcStart, float* destStart, const int copyWidth, const int srcJumpWidth, const int destJumpWidth, const int numElements) {
    // Calculate global thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Use a more efficient loop by incrementing with stride
    for (int i = idx; i < numElements; i += stride) {
        int row = i / copyWidth;
        int col = i % copyWidth;
        
        // Access source and destination with computed indices
        destStart[row * destJumpWidth + col] = srcStart[row * srcJumpWidth + col];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline int getTransArrayIndex(unsigned int width, unsigned int height, unsigned int i) {
    return height * (i % width) + i / width;
}

__global__ void kCopyToTransDestSlow(float* srcStart, float* destStart, unsigned int srcCopyWidth, unsigned int srcJumpWidth, unsigned int destJumpHeight, unsigned int numElements) {
    // Compute unique thread index consistently across blocks
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < numElements) {
        // Calculate row and column for optimized memory access
        unsigned int srcRow = idx / srcCopyWidth;
        unsigned int srcCol = idx % srcCopyWidth;
        unsigned int transIndex = destJumpHeight * srcCol + srcRow;

        // Use transIndex to access transposed memory efficiently
        destStart[transIndex] = srcStart[srcRow * srcJumpWidth + srcCol];
    }
}
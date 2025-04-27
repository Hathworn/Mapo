#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline int getTransArrayIndex(unsigned int width, unsigned int height, unsigned int i) {
    return height * (i % width) + i / width;
}

__global__ void kCopyToTransDest(float* srcStart, float* destStart, unsigned int srcCopyWidth, unsigned int srcJumpWidth, unsigned int destJumpHeight, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure idx is within bounds before proceeding
    if (idx >= numElements) return;

    // Pre-compute indices to reduce recalculation
    unsigned int srcRow = idx / srcCopyWidth;
    unsigned int srcCol = idx % srcCopyWidth;
    unsigned int srcIndex = srcRow * srcJumpWidth + srcCol;
    unsigned int destIndex = getTransArrayIndex(srcCopyWidth, destJumpHeight, idx);

    // Directly copy data from source to destination
    destStart[destIndex] = srcStart[srcIndex];
}
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline int getTransArrayIndex(unsigned int width, unsigned int height, unsigned int i) {
    return height * (i % width) + i / width;
}

__global__ void kCopyToTransDest(float* srcStart, float* destStart, unsigned int srcCopyWidth, unsigned int srcJumpWidth, unsigned int destJumpHeight, unsigned int numElements) {
    // Use cooperative memory access and avoid branching
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= numElements) return;

    unsigned int row = idx / srcCopyWidth;
    unsigned int col = idx % srcCopyWidth;
    unsigned int destIdx = getTransArrayIndex(srcCopyWidth, destJumpHeight, idx);
    unsigned int srcIdx = row * srcJumpWidth + col;

    destStart[destIdx] = srcStart[srcIdx];
}
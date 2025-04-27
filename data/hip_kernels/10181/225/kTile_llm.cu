#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate a unique index for each thread
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Total number of threads in the grid
    const int numThreads = blockDim.x * gridDim.x;

    // Pre-calculate total number of elements
    const unsigned int numEls = tgtWidth * tgtHeight;

    // Loop through target elements each thread should handle
    for (uint i = idx; i < numEls; i += numThreads) {
        // Calculate y and x based on index
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;

        // Calculate source y and x with modulus operator
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Efficient memory access by calculating source index once
        const uint srcIdx = srcY * srcWidth + srcX;

        // Assign value from source to target
        tgt[i] = src[srcIdx];
    }
}
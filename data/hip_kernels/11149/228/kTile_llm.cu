#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    // Calculate total elements once
    const uint numEls = tgtWidth * tgtHeight;

    for (uint i = idx; i < numEls; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        
        // Use modulo to wrap around source image
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Efficient direct indexing
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}
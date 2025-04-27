#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Cache total number of threads
    const int numThreads = blockDim.x * gridDim.x;

    // Iterate over global thread stride
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Compute target position
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        
        // Compute source position using modulo to create tiling effect
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Assign from source to target, using computed positions
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}
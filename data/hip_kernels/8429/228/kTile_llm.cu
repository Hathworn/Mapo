#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    
    // Prefetch frequently used values to avoid redundant computations
    const uint srcWidthTimesSrcHeight = srcWidth * srcHeight;
    
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        
        // Modulo is computationally expensive; optimize it if necessary
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Load source element with computed indices
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}
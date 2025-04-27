#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x; // Rename numThreads to stride for clarity
    
    // Precompute total elements in target for easy comparison in loop
    const unsigned int numEls = tgtWidth * tgtHeight; 
    
    for (uint i = idx; i < numEls; i += stride) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Efficient memory access using precomputed indexes
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}
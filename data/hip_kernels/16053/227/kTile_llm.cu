```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    // Calculate write stride for coalesced access
    const int rowStride = tgtWidth * srcHeight;
    
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate y and x using integer division and modulo
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        
        // Calculate source indices using modulo for tiling
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Write to target with coalesced accesses
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate indices once to reduce redundant computation
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    const uint totalElements = tgtWidth * tgtHeight;
    
    // Loop with stride for each thread to cover all elements
    for (uint i = idx; i < totalElements; i += numThreads) {
        // Compute output coordinates
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        
        // Effective input coordinates using modulo operation
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Copy data from source to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}
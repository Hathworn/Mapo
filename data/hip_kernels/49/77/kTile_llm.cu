#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Get total number of threads
    const int numThreads = blockDim.x * gridDim.x;
    
    // Loop over all target elements for this thread
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate 2D indices for tgt
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Map 2D indices to src
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Assign the value from src to tgt
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}
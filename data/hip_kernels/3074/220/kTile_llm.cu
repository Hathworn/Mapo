#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate global thread ID
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads
    const int numThreads = blockDim.x * gridDim.x;
    const unsigned int numEls = tgtWidth * tgtHeight;

    // Loop through elements processed by this thread
    for (uint i = idx; i < numEls; i += numThreads) {
        // Determine position in target and corresponding source
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Copy element from source to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate unique thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Compute total number of threads
    const int numThreads = blockDim.x * gridDim.x;
    // Loop without recalculating tgtWidth * tgtHeight
    const uint numEls = tgtWidth * tgtHeight;
    
    for (uint i = idx; i < numEls; i += numThreads) {
        // Optimize division and modulus with a single operation
        const uint y = i / tgtWidth;
        const uint x = i - y * tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Efficiently copy element from source to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    const unsigned int totalElements = tgtWidth * tgtHeight;
    
    // Loop efficiently over all target elements using grid-stride loop
    for (uint i = idx; i < totalElements; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Fetch source element and assign to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}